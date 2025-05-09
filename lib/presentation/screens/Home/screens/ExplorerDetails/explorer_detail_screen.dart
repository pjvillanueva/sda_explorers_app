import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/logic/services/helpers.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/avatar.dart';
import 'package:sda_explorers_app/presentation/screens/Home/screens/ExplorerDetails/components/lesson_control_grid.dart';
import 'package:sda_explorers_app/presentation/screens/Home/screens/ExplorerDetails/cubits/explorer_detail_cubit.dart';

class ExplorerDetailScreen extends StatelessWidget {
  const ExplorerDetailScreen({super.key, required this.explorer});

  final Explorer explorer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExplorerDetailCubit()..initialLessonControl(explorer.allowedLessons),
      lazy: true,
      child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        AppAvatar(
                          size: 100.0,
                          innerColor:
                              colorFromHex(explorer.user?.backgroundColor),
                          avatar: explorer.user?.avatar ?? 'matthew',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          explorer.user?.fullName ?? 'Guest Explorer',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Controls',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  LessonControlGrid(explorerId: explorer.id),
                  Text(
                    'Tests',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  //get explorers tests
                  // FutureBuilder<List<ExplorerAnswers>>(future: , builder: builder)
                ],
              ),
            ),
          ))),
    );
  }
}
