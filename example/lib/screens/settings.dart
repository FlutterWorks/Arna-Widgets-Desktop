import 'package:arna/arna.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Brightness? themeMode = ref.watch(themeProvider);
    final bool masterMode = ref.watch(masterProvider);
    final Color accentColor = ref.watch(accentProvider);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ArnaList(
            title: 'Theme',
            showDividers: true,
            showBackground: true,
            children: <Widget>[
              ArnaRadioListTile<Brightness?>(
                value: null,
                groupValue: themeMode,
                title: 'System',
                onChanged: (_) => ref.read(themeProvider.notifier).state = null,
              ),
              ArnaRadioListTile<Brightness?>(
                value: Brightness.dark,
                groupValue: themeMode,
                title: 'Dark',
                onChanged: (_) => ref.read(themeProvider.notifier).state = Brightness.dark,
              ),
              ArnaRadioListTile<Brightness?>(
                value: Brightness.light,
                groupValue: themeMode,
                title: 'Light',
                onChanged: (_) => ref.read(themeProvider.notifier).state = Brightness.light,
              ),
            ],
          ),
          ArnaList(
            title: 'Scaffold',
            showBackground: true,
            children: <Widget>[
              ArnaSwitchListTile(
                value: masterMode,
                title: 'Use Master-Detail',
                onChanged: (_) => ref.read(masterProvider.notifier).state = !masterMode,
              ),
            ],
          ),
          ArnaList(
            title: 'Accent',
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            showBackground: true,
            children: <Widget>[
              ArnaColorButton<Color>(
                value: ArnaColors.blue,
                groupValue: accentColor,
                onPressed: () => ref.read(accentProvider.notifier).state = ArnaColors.blue,
                color: ArnaColors.blue,
              ),
              ArnaColorButton<Color>(
                value: ArnaColors.green,
                groupValue: accentColor,
                onPressed: () => ref.read(accentProvider.notifier).state = ArnaColors.green,
                color: ArnaColors.green,
              ),
              ArnaColorButton<Color>(
                value: ArnaColors.red,
                groupValue: accentColor,
                onPressed: () => ref.read(accentProvider.notifier).state = ArnaColors.red,
                color: ArnaColors.red,
              ),
              ArnaColorButton<Color>(
                value: ArnaColors.orange,
                groupValue: accentColor,
                onPressed: () => ref.read(accentProvider.notifier).state = ArnaColors.orange,
                color: ArnaColors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final AutoDisposeStateProvider<Brightness?> themeProvider = StateProvider.autoDispose<Brightness?>(
  (AutoDisposeStateProviderRef<Brightness?> ref) => null,
);

final AutoDisposeStateProvider<bool> masterProvider = StateProvider.autoDispose<bool>(
  (AutoDisposeStateProviderRef<bool> ref) => false,
);

final AutoDisposeStateProvider<Color> accentProvider = StateProvider.autoDispose<Color>(
  (AutoDisposeStateProviderRef<Color> ref) => ArnaColors.blue,
);
