import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'display_mode_provider.g.dart';

enum DisplayMode {
  mobile,
  tablet,
  desktop,
}

// class _DisplayModeNotifier extends StateNotifier<DisplayMode> {
//   _DisplayModeNotifier() : super(DisplayMode.desktop);

//   void applyWidth(double width) {
//     if (width < 500) {
//       state = DisplayMode.mobile;
//     } else if (width < 1100) {
//       state = DisplayMode.tablet;
//     } else {
//       state = DisplayMode.desktop;
//     }
//   }
// }

// final displayModeProvider =
//     StateNotifierProvider<_DisplayModeNotifier, DisplayMode>(
//         (_) => _DisplayModeNotifier());

@hcwidget
Widget _displayModeScope(WidgetRef ref, {required Widget child}) {
  final width = MediaQuery.of(useContext()).size.width;
  useEffect(() {
    Future.microtask(() {
      ref.read(displayModeProvider.notifier).applyWidth(width);
    });

    return null;
  }, [width]);

  return child;
}
