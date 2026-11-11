
import 'package:flutter/material.dart';

import '../widgets/theme_toggle_card.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() =>
      _HalamanPengaturanState();
}

class _HalamanPengaturanState
    extends State<HalamanPengaturan> {
  bool _notifikasiAktif = true;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Pengaturan Aplikasi',
          style: tema.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Atur preferensi aplikasi Mitigasi+.',
          style: tema.textTheme.bodyMedium?.copyWith(
            color: tema.colorScheme.onSurfaceVariant,
          ),
        ),

        const SizedBox(height: 24),

        // Pengaturan Notifikasi
        Card(
          child: SwitchListTile(
            secondary: Icon(
              Icons.notifications_outlined,
              color: tema.colorScheme.primary,
            ),
            title: const Text('Notifikasi'),
            subtitle: const Text(
              'Terima informasi dan peringatan bencana.',
            ),
            value: _notifikasiAktif,
            onChanged: (value) {
              setState(() {
                _notifikasiAktif = value;
              });
            },
          ),
        ),

        const SizedBox(height: 12),

        // Custom Widget Mode Gelap
        const ThemeToggleCard(),

        const SizedBox(height: 12),

        // Pengaturan Wilayah
        Card(
          child: ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: tema.colorScheme.primary,
            ),
            title: const Text('Wilayah'),
            subtitle: const Text('Kota Palu'),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
