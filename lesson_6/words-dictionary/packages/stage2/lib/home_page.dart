import 'package:flutter/material.dart';
import 'package:stage2/data/language.dart';
import 'package:stage2/language_filters_provider.dart';
import 'package:stage2/style.dart';
import 'package:stage2/words_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language wordLanguage = Language.russian;
  Language translationLanguage = Language.english;

  void _updateState({
    Language? newWordLanguage,
    Language? newTranslationLanguage,
  }) {
    setState(() {
      wordLanguage = newWordLanguage ?? wordLanguage;
      translationLanguage = newTranslationLanguage ?? translationLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _LanguageDropdownField(
                  value: wordLanguage,
                  onChanged: (Language value) =>
                      _updateState(newWordLanguage: value),
                  label: 'Word language:',
                ),
              ),
              Expanded(
                child: _LanguageDropdownField(
                  value: translationLanguage,
                  onChanged: (Language value) =>
                      _updateState(newTranslationLanguage: value),
                  label: 'Translation language:',
                ),
              ),
              Expanded(child: Center(child: _PrintButton())),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          LanguageFiltersProvider(
            translationLanguage: translationLanguage,
            wordLanguage: wordLanguage,
            child: const WordsList(),
          ),
        ],
      ),
    );
  }
}

class _PrintButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Print',
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class _LanguageDropdownField extends StatelessWidget {
  const _LanguageDropdownField({
    required this.value,
    required this.onChanged,
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
  final Language value;
  final ValueChanged<Language> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: fontSize),
        ),
        const SizedBox(width: 24),
        DropdownButton<Language>(
          value: value,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple, fontSize: fontSize),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (Language? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: Language.values
              .map((Language value) => DropdownMenuItem<Language>(
                    value: value,
                    child: Text(value.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
