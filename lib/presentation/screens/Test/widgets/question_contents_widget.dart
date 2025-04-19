import 'package:flutter/material.dart';

class EnumerateField extends StatefulWidget {
  const EnumerateField({
    super.key,
    required this.index,
    required this.controller,
  });

  final String index;
  final TextEditingController controller;

  @override
  State<EnumerateField> createState() => _EnumerateFieldState();
}

class _EnumerateFieldState extends State<EnumerateField> {
  bool haveError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(bottom: haveError ? 20 : 0),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.rectangle,
                border: Border(
                  top: BorderSide(color: Colors.black, width: 2.0),
                  left: BorderSide(color: Colors.black, width: 2.0),
                  bottom: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              child: Center(
                child: Text(
                  widget.index,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      haveError = true;
                    });
                    return "This field is required";
                  } else {
                    setState(() {
                      haveError = false;
                    });
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: haveError ? 0.0 : 10.0),
      ],
    );
  }
}
