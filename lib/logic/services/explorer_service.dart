import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:sda_explorers_app/logic/services/internet_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/loading_indicator.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';

Future<void> updateExplorer(BuildContext context, String explorerId,
    Map<String, dynamic> updatedData) async {
  try {
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return;
    }
    showLoading(context);
    await FirebaseFirestore.instance
        .collection('explorers')
        .doc(explorerId)
        .update(updatedData);

    Navigator.pop(context);
    AppSnackBar.show(context,
        message: 'Explorer updated successfully', type: SBMessageType.success);
  } catch (e) {
    print('Error updating explorer: $e');
    AppSnackBar.show(context,
        message: 'Explorer update failed', type: SBMessageType.error);
  }
}
