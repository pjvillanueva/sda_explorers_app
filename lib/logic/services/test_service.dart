import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/answer.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/internet_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';

Future<ExplorerAnswers?> getExplorerAnswer(
    BuildContext context) async {
  try {
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return null;
    }

    final explorerId = context.read<UserCubit>().state.roleData['id'] ?? '';

    if (explorerId == '') {
      print("❌ Explorer ID is empty.");
      return null;
    }

    final firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('explorerAnswers').doc(explorerId);

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final explorerAnswer = ExplorerAnswers.fromJson(snapshot.data()!);
      return explorerAnswer;
    } else {
      print("❌ No data found for explorerId.");
      return null;
    }
  } catch (e) {
    print("❌ Error fetching ExplorerAnswers: $e");
    AppSnackBar.show(context,
        message: 'Error fetching test answers: $e', type: SBMessageType.error);
    return null;
  }
}

Future<void> saveAnswers({
  required BuildContext context,
  required String explorerId,
  required int lessonNumber,
  required Map<String, List<Answer>> answers,
}) async {
  try {
    if (await isConnected() == false) {
      AppSnackBar.show(context,
          message: 'Not connected to the internet', type: SBMessageType.info);
      return;
    }

    final firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('explorerAnswers').doc(explorerId);

    final newLessonAnswers = LessonAnswers(
      lessonNumber: lessonNumber,
      answers: answers,
    );

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final existingData = ExplorerAnswers.fromJson(snapshot.data()!);

      final updatedLessons =
          List<LessonAnswers>.from(existingData.lessonAnswers);
      final index =
          updatedLessons.indexWhere((e) => e.lessonNumber == lessonNumber);

      if (index >= 0) {
        updatedLessons[index] = newLessonAnswers;
      } else {
        updatedLessons.add(newLessonAnswers);
      }

      final updatedExplorer = ExplorerAnswers(
        explorerId: explorerId,
        lessonAnswers: updatedLessons,
      );

      await docRef.set(updatedExplorer.toJson());
    } else {
      final newExplorer = ExplorerAnswers(
        explorerId: explorerId,
        lessonAnswers: [newLessonAnswers],
      );

      await docRef.set(newExplorer.toJson());
    }
    print("✅ ExplorerAnswers saved/updated successfully.");
    AppSnackBar.show(context,
        message: 'Test answers saved successfully',
        type: SBMessageType.success);
  } catch (e) {
    print("❌ Error saving ExplorerAnswers: $e");
    AppSnackBar.show(context,
        message: 'Error saving test answers: $e', type: SBMessageType.error);
  }
}
