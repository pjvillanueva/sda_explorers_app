import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/dialogs.dart';
import '../../logic/blocs/input_page_cubit.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _dropdownValue = 'T';
  Map<String, String> lessonTypes = {
    'T': 'Title',
    'M': 'Memory Verse',
    'S': 'Subtitle',
    'P': 'Paragraph',
    'Q': 'Question',
    'B': 'Bible Verse',
    'I': 'Index'
  };
  int lessonNumber = 1;
  int sequenceNumber = 1;
  TextEditingController textEditingController = TextEditingController(text: '');
  TextEditingController allTextEditingController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Input Page'),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                  icon: const Icon(Icons.input),
                  onPressed: () async {
                    var result = await showRawTextInputDialog(context);
                    print(result);
                  })
            ]),
        body: BlocProvider(
            create: (context) => InputPageCubit(),
            child: BlocBuilder<InputPageCubit, InputPageState>(
                builder: (context, state) {
              return SafeArea(
                  child: ListView(children: [
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(width: 20),
                  const Text('LESSON:',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (lessonNumber != 1) {
                          setState(() {
                            lessonNumber--;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_left,
                          size: 30, color: Colors.black)),
                  const SizedBox(width: 20),
                  Text(lessonNumber.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () {
                        if (lessonNumber != 100) {
                          setState(() {
                            lessonNumber++;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_right, color: Colors.black))
                ]),
                const Divider(),
                const SizedBox(height: 10),
                Row(children: [
                  const SizedBox(width: 20),
                  const Text('TYPE:',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const Spacer(),
                  DropdownButton<String>(
                      value: _dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: lessonTypes.keys
                          .map<DropdownMenuItem<String>>((String key) {
                        return DropdownMenuItem<String>(
                            value: key,
                            child: Text(lessonTypes[key] ?? 'Error',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                        });
                      }),
                  const SizedBox(width: 10),
                ]),
                const Divider(),
                Row(children: [
                  const SizedBox(width: 20),
                  const Text('SEQUENCE #:',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (sequenceNumber != 1) {
                          setState(() {
                            sequenceNumber--;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_left,
                          size: 30, color: Colors.black)),
                  const SizedBox(width: 20),
                  Text(sequenceNumber.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () {
                        if (sequenceNumber != 100) {
                          setState(() {
                            sequenceNumber++;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_right, color: Colors.black))
                ]),
                const Divider(),
                Row(children: [
                  const SizedBox(width: 25),
                  const Text('CONTENT:',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text(
                          'SAVE: ${getCode(lessonNumber, _dropdownValue, sequenceNumber)}',
                          style: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        var code = getCode(
                            lessonNumber, _dropdownValue, sequenceNumber);
                        BlocProvider.of<InputPageCubit>(context)
                            .addContent(code, textEditingController.text);
                        setState(() {
                          sequenceNumber++;
                        });
                        textEditingController.clear();
                      }),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: const Text('COPY',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        BlocProvider.of<InputPageCubit>(context)
                            .copyContents(lessonNumber);
                      }),
                  const SizedBox(width: 20),
                ]),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: textEditingController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter text here'),
                        maxLines: 8)),
                // const Row(
                //   children: [
                //     SizedBox(width: 20),
                //     Text('ALL CONTENT:',
                //         style: TextStyle(
                //             fontSize: 20, fontWeight: FontWeight.bold))
                //   ],
                // ),
                // Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 20.0, vertical: 5.0),
                //     child: TextFormField(
                //         controller: allTextEditingController,
                //         maxLines: 20,
                //         decoration: const InputDecoration(
                //           border: OutlineInputBorder(),
                //           enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.black)),
                //         ))),
                // const SizedBox(height: 100),
              ]));
            })));
  }
}

String getCode(int lessonNumber, String lessonType, int sequenceNumber) {
  return 'L${lessonNumber.toString()}${lessonType.toUpperCase()}${sequenceNumber.toString()}';
}
