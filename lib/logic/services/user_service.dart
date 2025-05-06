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
import 'package:sda_explorers_app/presentation/custom%20widgets/loading_indicator.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';

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
    var role = context.read<UserCubit>().state.role;

    if (role == null || role.roleName.isEmpty) {
      await _signOut();
      return false;
    }
    await getRoleData(user.id, role.roleId, context);
    return true;
  } catch (e) {
    await _signOut();
  }
  return false;
}

Future<void> getUser(BuildContext context) async {
  try {
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
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
        avatar: userData['avatar'] ?? 'matthew',
        backgroundColor: userData['backgroundColor'] ?? '#FF80A3D9',
        expPoints: userData['expPoints'] ?? 0,
      );

      context.read<UserCubit>().updateUser(user);
    } else {
      print('User not found');
      AppSnackBar.show(context,
          message: 'User not found', type: SBMessageType.error);
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
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
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

Future<void> getRoleData(
    String userId, String roleId, BuildContext context) async {
  try {
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return;
    }

    String colName = '';

    final firestore = FirebaseFirestore.instance;

    if (roleId == OWNER_ROLE_ID) {
      colName = 'admins';
    } else if (roleId == ADMIN_ROLE_ID) {
      colName = 'admins';
    } else if (roleId == GUIDE_ROLE_ID) {
      colName = 'guides';
    } else if (roleId == EXPLORER_ROLE_ID) {
      colName = 'explorers';
    } else {
      print('Do nothing for guest role');
      return;
    }

    final querySnapshot = await firestore
        .collection(colName)
        .where('userId', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      var roleData = doc.data();
      context.read<UserCubit>().updateRoleData(roleData);
    } else {
      print('No user role data found for user ID: $userId');
      context.read<UserCubit>().updateRoleData(null);
    }
  } catch (e) {
    print('Error getting user role: $e');
    context.read<UserCubit>().updateRoleData(null);
  }
}

Future<void> updateUser(BuildContext context, String? userId,
    Map<String, dynamic> updatedData) async {
  try {
    if (userId == null) {
      AppSnackBar.show(context,
          message: 'User ID is null', type: SBMessageType.error);
      return;
    }

    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return;
    }

    showLoading(context);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(updatedData);

    Navigator.pop(context);

    AppSnackBar.show(context,
        message: 'Updated user successfully', type: SBMessageType.success);
  } catch (e) {
    print('Error updating user: $e');
    AppSnackBar.show(context,
        message: 'User update failed', type: SBMessageType.error);
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
