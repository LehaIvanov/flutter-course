import 'package:flutter/material.dart';
import 'package:stage0/data/language.dart';
import 'package:stage0/style.dart';
import 'package:stage0/words_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  value: Language.russian,
                  onChanged: (Language value) {},
                  label: 'Word language:',
                ),
              ),
              Expanded(
                child: _LanguageDropdownField(
                  value: Language.english,
                  onChanged: (Language value) {},
                  label: 'Translation language:',
                ),
              ),
              Expanded(child: Center(child: _PrintButton())),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          const WordsList(),
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
