import 'package:flutter/material.dart';
import 'package:stage1/data/language.dart';

const _errorMessage = 'No LanguageFiltersConfig found in context';

class LanguageFiltersProvider extends InheritedWidget {
  const LanguageFiltersProvider({
    Key? key,
    required this.wordLanguage,
    required this.translationLanguage,
    required Widget child,
  }) : super(key: key, child: child);

  final Language wordLanguage;
  final Language translationLanguage;

  static LanguageFiltersProvider of(BuildContext context) {
    final LanguageFiltersProvider? result =
        context.dependOnInheritedWidgetOfExactType<LanguageFiltersProvider>();
    if (result == null) {
      throw Exception(_errorMessage);
    }
    return result;
  }

  @override
  bool updateShouldNotify(LanguageFiltersProvider oldWidget) {
    return wordLanguage != oldWidget.wordLanguage ||
        translationLanguage != oldWidget.translationLanguage;
  }
}
