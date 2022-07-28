import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_query_with_provider/display_mode.dart';

part 'display_mode_state.g.dart';

@hcwidget
Widget _displayModeScope(BuildContext context, WidgetRef ref,
    {required Widget child}) {
  final width = MediaQuery.of(context).size.width;
  useEffect(() {
    Future.microtask(
      () => ref.read(displayModeProvider.notifier).applyWidth(width),
    );

    return null;
  }, [width]);

  return child;
}

class DisplayModeNotifier extends StateNotifier<DisplayMode> {
  DisplayModeNotifier() : super(DisplayMode.desktop);

  void applyWidth(double displayWidth) {
    if (displayWidth < 500) {
      state = DisplayMode.mobile;
    } else if (displayWidth < 1100) {
      state = DisplayMode.tablet;
    } else {
      state = DisplayMode.desktop;
    }
  }
}

final displayModeProvider =
    StateNotifierProvider<DisplayModeNotifier, DisplayMode>(
        (_) => DisplayModeNotifier());
