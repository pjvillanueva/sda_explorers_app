import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class BibleScreen extends StatefulWidget {
  final String? book;
  final int? chapter;
  final int? verse;

  const BibleScreen({super.key, this.book, this.chapter, this.verse});

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  List<dynamic> verses = [];
  List<String> books = [];
  List<int> chapters = [];
  List<int> versesForChapter = [];

  String? selectedBook;
  int? selectedChapter;
  int? selectedVerse;

  List<dynamic> filteredVerses = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadBibleData();
  }

  Future<void> loadBibleData() async {
    final String response =
        await rootBundle.loadString('assets/bibles/biblia.json');
    final data = json.decode(response);
    setState(() {
      verses = data['verses'];
      books =
          verses.map((verse) => verse['book_name'] as String).toSet().toList();

      // Set initial selection based on optional parameters
      selectedBook = widget.book ?? books.first;
      filterChapters();
      selectedChapter = widget.chapter ?? chapters.first;
      filterVerses();
      selectedVerse = widget.verse ?? versesForChapter.first;

      // Use addPostFrameCallback to ensure the UI is built before scrolling
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToSelectedVerse(); // Scroll to the selected verse
      });
    });
  }

  void filterChapters() {
    if (selectedBook != null) {
      final bookVerses =
          verses.where((verse) => verse['book_name'] == selectedBook).toList();
      chapters =
          bookVerses.map((verse) => verse['chapter'] as int).toSet().toList();
    }
  }

  void filterVerses() {
    if (selectedBook != null && selectedChapter != null) {
      final bookVerses = verses
          .where((verse) =>
              verse['book_name'] == selectedBook &&
              verse['chapter'] == selectedChapter)
          .toList();
      versesForChapter =
          bookVerses.map((verse) => verse['verse'] as int).toSet().toList();
      filteredVerses = bookVerses;
    }
  }

  void scrollToSelectedVerse() {
    if (selectedVerse != null) {
      final index =
          filteredVerses.indexWhere((verse) => verse['verse'] == selectedVerse);
      if (index != -1) {
        double offset = index * 80.0;
        final appBarHeight = AppBar().preferredSize.height;
        offset -= appBarHeight;

        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Ang Biblia (1905)"),
          backgroundColor: const Color.fromRGBO(229, 172, 63, 1)),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromRGBO(229, 172, 63, 1),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedBook,
                    onChanged: (value) {
                      setState(() {
                        selectedBook = value;
                        filterChapters();
                        selectedChapter =
                            chapters.isNotEmpty ? chapters.first : null;
                        filterVerses();
                        selectedVerse = versesForChapter.isNotEmpty
                            ? versesForChapter.first
                            : null;

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          scrollToSelectedVerse();
                        });
                      });
                    },
                    items: books.map<DropdownMenuItem<String>>((String book) {
                      return DropdownMenuItem<String>(
                        value: book,
                        child: Text(book),
                      );
                    }).toList(),
                    isExpanded: true,
                    hint: const Text('Select Book'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: DropdownButton<int>(
                    value: selectedChapter,
                    onChanged: (value) {
                      setState(() {
                        selectedChapter = value;
                        filterVerses();
                        selectedVerse = versesForChapter.isNotEmpty
                            ? versesForChapter.first
                            : null;

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          scrollToSelectedVerse();
                        });
                      });
                    },
                    items: chapters.map<DropdownMenuItem<int>>((int chapter) {
                      return DropdownMenuItem<int>(
                        value: chapter,
                        child: Text(' $chapter'),
                      );
                    }).toList(),
                    isExpanded: true,
                    hint: const Text('Select Chapter'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: DropdownButton<int>(
                    value: selectedVerse,
                    onChanged: (value) {
                      setState(() {
                        selectedVerse = value;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          scrollToSelectedVerse();
                        });
                      });
                    },
                    items: versesForChapter
                        .map<DropdownMenuItem<int>>((int verse) {
                      return DropdownMenuItem<int>(
                        value: verse,
                        child: Text('$verse'),
                      );
                    }).toList(),
                    isExpanded: true,
                    hint: const Text('Select Verse'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: filteredVerses.length,
              itemBuilder: (context, index) {
                final verse = filteredVerses[index];
                final isSelected = selectedVerse == verse['verse'];
                return ListTile(
                  subtitle: Text('${verse['verse']}  ${verse['text']}'),
                  tileColor: isSelected ? Colors.blue.withOpacity(0.3) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
