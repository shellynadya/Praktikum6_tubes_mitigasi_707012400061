
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

class ThemeToggleCard extends StatelessWidget {
  const ThemeToggleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final modeGelap = mode == ThemeMode.dark;
        final warna = Theme.of(context).colorScheme;

        return Card(
          child: SwitchListTile(
            secondary: Icon(
              modeGelap
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: warna.primary,
            ),
            title: const Text('Mode Gelap'),
            subtitle: const Text(
              'Gunakan tampilan gelap pada aplikasi.',
            ),
            value: modeGelap,
            onChanged: (value) {
              context.read<ThemeCubit>().ubahTema(value);
            },
          ),
        );
      },
    );
  }
}
