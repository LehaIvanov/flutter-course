import 'package:flutter/material.dart';
import 'package:stage2/data/word.dart';
import 'package:stage2/data/words_service.dart';
import 'package:stage2/language_filters_provider.dart';
import 'package:stage2/style.dart';

class WordsList extends StatefulWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  List<Word> _words = [];

  @override
  void initState() {
    _words = getWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _words.length,
      itemBuilder: (_, index) {
        final word = _words[index];

        return Row(
          children: [
            Expanded(child: _NativeLanguageWord(word: word)),
            Expanded(child: _StudiedLanguageWord(word: word)),
            Expanded(child: _WordCheckbox(word: word)),
          ],
        );
      },
    );
  }
}

class _NativeLanguageWord extends StatelessWidget {
  const _NativeLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    print('_NativeLanguageWord');
    return Text(
      word.translations[LanguageFiltersProvider.of(
                  context, LanguageFilterProperty.wordLanguage)
              .wordLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _StudiedLanguageWord extends StatelessWidget {
  const _StudiedLanguageWord({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    print('_StudiedLanguageWord');
    return Text(
      word.translations[LanguageFiltersProvider.of(
                  context, LanguageFilterProperty.translationLanguage)
              .translationLanguage] ??
          '',
      style: const TextStyle(fontSize: fontSize),
    );
  }
}

class _WordCheckbox extends StatelessWidget {
  const _WordCheckbox({Key? key, required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: false,
      onChanged: (bool? value) {},
    );
  }
}
