// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/user.dart' as app_user;
import 'package:sda_explorers_app/data/models/user_roles.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/internet_service.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';

Future<bool> verifyUser(BuildContext context) async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      await _signOut();
      return false;
    }

    if (currentUser.isAnonymous) {
      await StorageManager().deleteData('user_id');
      context.read<UserCubit>().clearUser();
      return true;
    }

    await getUser(context);
    var user = context.read<UserCubit>().state.user;
    print('User: $user');

    if (user == null || user.id.isEmpty) {
      await _signOut();
      return false;
    }

    await getUserRole(user.id, context);
    return true;
  } catch (e) {
    await _signOut();
  }
  return false;
}

Future<void> getUser(BuildContext context) async {
  try {
    if (await isConnected() == false) {
      return;
    }

    var userId = await StorageManager().getString('user_id');

    if (userId == null) {
      print('User ID not found in local storage');
      return;
    }

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      app_user.User user = app_user.User(
        userData['id'] ?? '',
        userData['firstName'] ?? '',
        userData['lastName'] ?? '',
        userData['email'] ?? '',
        userData['phoneNumber'] ?? '',
        imageUrl: userData['imageUrl'] ?? '',
        avatar: userData['avatar'] ?? 'sheep',
        backgroundColor: userData['backgroundColor'] ?? '#FF80A3D9',
        expPoints: userData['expPoints'] ?? 0,
      );

      context.read<UserCubit>().updateUser(user);
    } else {
      print('User not found');
      return;
    }
  } catch (e) {
    print('Error getting user: $e');
  }
}

_signOut() async {
  await StorageManager().deleteData('user_id');
  await FirebaseAuth.instance.signOut();
}

Future<void> getUserRole(String userId, BuildContext context) async {
  try {
    if (await isConnected() == false) {
      return;
    }

    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore
        .collection('userRoles')
        .where('userId', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      UserRole role = UserRole.fromJson(doc.data());
      context.read<UserCubit>().updateRole(role);
    } else {
      print('No user role found for user ID: $userId');
      context.read<UserCubit>().updateRole(guestUserRole);
    }
  } catch (e) {
    print('Error getting user role: $e');
  }
}

// // Function to add or update user role in Firestore
// Future<void> setUserRole(String userId, String roleId) async {
//   final firestore = FirebaseFirestore.instance;

//   final userRoleId = firestore.collection('userRoles').doc().id;
//   print('🟡 setUserRole CALLED');
//   print('🟢 Creating role document with ID: $userRoleId');

//   final userRole = UserRole(
//     id: userRoleId,
//     userId: userId,
//     roleId: roleId,
//   );

//   print('📤 Saving this data to Firestore: ${userRole.toJson()}');

//   try {
//     await firestore
//         .collection('userRoles')
//         .doc(userRoleId)
//         .set(userRole.toJson());

//     print('✅ Role saved successfully!');
//   } catch (e, stack) {
//     print('❌ Failed to save role: $e');
//     print(stack);
//   }
// }
