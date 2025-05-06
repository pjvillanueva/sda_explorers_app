import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/data/models/guide.dart';
import 'package:sda_explorers_app/data/models/user.dart' as app_user;
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/internet_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';

Future<List<Explorer>> fetchMyExplorers(
    BuildContext context, String? userId) async {
  try {
    if (userId == null || userId.isEmpty) {
      return [];
    }
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return [];
    }
    final firestore = FirebaseFirestore.instance;

    final roleData = context.read<UserCubit>().state.roleData;
    if (roleData == null) {
      return [];
    }

    final guide = Guide.fromJson(roleData);
    if (guide.explorerIds.isEmpty) {
      return [];
    }

    final explorerIds = guide.explorerIds;
    final explorers = await firestore
        .collection('explorers')
        .where(FieldPath.documentId, whereIn: explorerIds)
        .get();
    
    final explorerList = explorers.docs.map((doc) {
      return Explorer.fromJson(doc.data());
    }).toList();

    for (var explorer in explorerList) {
      final userDoc = await firestore
          .collection('users')
          .doc(explorer.userId)
          .get();
      if (userDoc.exists) {
        explorer.user = app_user.User.fromJson(userDoc.data()!);
      }
    }
    return explorerList;
  } catch (e) {
    print('Error fetching explorers: $e');
    return [];
  }
  //   try {
  //   DocumentSnapshot doc = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .get();

  //   if (doc.exists) {
  //     return doc.data() as Map<String, dynamic>;
  //   } else {
  //     print('User not found.');
  //     return null;
  //   }
  // } catch (e) {
  //   print('Error fetching user: $e');
  //   return [];
}
