import 'package:flutter/material.dart';
import 'package:stage2/data/language.dart';

const _errorMessage = 'No LanguageFiltersConfig found in context';

class LanguageFiltersProvider extends InheritedModel<LanguageFilterProperty> {
  const LanguageFiltersProvider({
    Key? key,
    required this.wordLanguage,
    required this.translationLanguage,
    required Widget child,
  }) : super(key: key, child: child);

  final Language wordLanguage;
  final Language translationLanguage;

  static LanguageFiltersProvider of(
      BuildContext context, LanguageFilterProperty aspect) {
    final LanguageFiltersProvider? result =
        InheritedModel.inheritFrom<LanguageFiltersProvider>(context,
            aspect: aspect);
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

  @override
  bool updateShouldNotifyDependent(LanguageFiltersProvider oldWidget,
      Set<LanguageFilterProperty> dependencies) {
    return (wordLanguage != oldWidget.wordLanguage &&
            dependencies.contains(LanguageFilterProperty.wordLanguage)) ||
        (translationLanguage != oldWidget.translationLanguage &&
            dependencies.contains(LanguageFilterProperty.translationLanguage));
  }
}

enum LanguageFilterProperty { wordLanguage, translationLanguage }
