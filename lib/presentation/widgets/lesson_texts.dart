import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/data/lessons/helpers.dart';

abstract class LessonTexts {
  final String text;
  final String code;

  LessonTexts(this.text, this.code);
}

class LessonTitle extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const LessonTitle(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.robotoSlab(
            fontSize: 24, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MemoryVerse extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const MemoryVerse(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.raleway(
              fontSize: 18, color: Theme.of(context).colorScheme.onSurface, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}

class Paragraph extends StatelessWidget implements LessonTexts {
  @override
  final String text;
  @override
  final String code;
  final bool isFirst;

  const Paragraph(this.text, this.code, {this.isFirst = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: GoogleFonts.nunito(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
          children: [
            if (isFirst && text.isNotEmpty)
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(-2, 5),
                  child: Text(
                    text[0],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      height: 1,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            TextSpan(
              text: isFirst && text.length > 1
                  ? text.substring(1)
                  : addIndention(text),
            ),
          ],
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const Subtitle(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.lora(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Question extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const Question(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.openSans(color: Theme.of(context).colorScheme.onSurface, fontSize: 16),
      ),
    );
  }
}

class BibleVerse extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const BibleVerse(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.libreBaskerville(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Index extends StatelessWidget implements LessonTexts {
  @override
  final String text;

  @override
  final String code;

  const Index(this.text, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageName;
  final double height;

  const ImageContainer(this.imageName, {Key? key, this.height = 300.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Image.asset('assets/images/$imageName', fit: BoxFit.cover),
    );
  }
}
