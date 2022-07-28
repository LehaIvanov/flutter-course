import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage0/display_mode.dart';

part 'display_mode_state.g.dart';

final displayModeProvider =
    StateProvider<DisplayMode>((_) => DisplayMode.desktop);

@hcwidget
Widget _displayModeScope(BuildContext context, WidgetRef ref,
    {required Widget child}) {
  final width = MediaQuery.of(context).size.width;
  useEffect(() {
    Future.microtask(() => {
          ref.read(displayModeProvider.notifier).state = _getDisplayMode(width)
        });

    return null;
  }, [width]);

  return child;
}

DisplayMode _getDisplayMode(double displayWidth) {
  if (displayWidth < 500) {
    return DisplayMode.mobile;
  } else if (displayWidth < 1100) {
    return DisplayMode.tablet;
  } else {
    return DisplayMode.desktop;
  }
}
