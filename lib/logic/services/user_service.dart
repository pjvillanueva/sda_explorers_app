import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/user.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';

Future<void> getUser(BuildContext context) async {
  try {
    var userId = await StorageManager().getString('user_id');

    print("THIS IS USER ID: $userId");
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      // Extract data from the document
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      // Convert userData map to User object
      User user = User(
        userData['id'] ?? '',
        userData['firstName'] ?? '',
        userData['lastName'] ?? '',
        userData['email'] ?? '',
        userData['phoneNumber'] ?? '',
      );
      //save user to bloc
      context.read<UserCubit>().updateUser(user);
    } else {

      print('User not found');
    }
  } catch (e) {
    print('Error getting user: $e');
  }
}
