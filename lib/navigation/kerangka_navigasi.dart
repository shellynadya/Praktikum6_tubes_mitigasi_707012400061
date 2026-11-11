import 'package:flutter/material.dart';

import '../pages/halaman_beranda.dart';
import '../pages/halaman_laporan.dart';
import '../pages/halaman_mitigasi.dart';
import '../pages/halaman_pengaturan.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanMitigasi(),
    HalamanLaporan(),
    HalamanPengaturan(),
  ];

  final List<String> _judul = const [
    'Beranda',
    'Mitigasi',
    'Laporan',
    'Pengaturan',
  ];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebar >= 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_indeksTerpilih]),
      ),

      // Drawer untuk menu utama dan pendukung
      drawer: _buatDrawer(),

      body: layarLebar
          ? _tataLetakLebar()
          : _halaman[_indeksTerpilih],

      bottomNavigationBar: layarLebar
          ? null
          : _buatBilahBawah(),
    );
  }

  // Navigasi bawah untuk layar kecil
  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        NavigationDestination(
          icon: Icon(Icons.shield_outlined),
          selectedIcon: Icon(Icons.shield),
          label: 'Mitigasi',
        ),
        NavigationDestination(
          icon: Icon(Icons.report_outlined),
          selectedIcon: Icon(Icons.report),
          label: 'Laporan',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
    );
  }

  // NavigationRail untuk layar lebar
  Widget _tataLetakLebar() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          leading: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Icon(
              Icons.shield,
              size: 32,
            ),
          ),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.shield_outlined),
              selectedIcon: Icon(Icons.shield),
              label: Text('Mitigasi'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.report_outlined),
              selectedIcon: Icon(Icons.report),
              label: Text('Laporan'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Pengaturan'),
            ),
          ],
        ),

        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),

        Expanded(
          child: _halaman[_indeksTerpilih],
        ),
      ],
    );
  }

  // Drawer untuk navigasi tambahan
  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        if (indeks >= 0 && indeks < _halaman.length) {
          _pilihTujuan(indeks);
          Navigator.pop(context);
        }
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Pengguna Mitigasi+'),
          accountEmail: Text('Kota Palu'),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            16,
            16,
            10,
          ),
          child: Text(
            'Menu Utama',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.shield_outlined),
          selectedIcon: Icon(Icons.shield),
          label: Text('Mitigasi'),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.report_outlined),
          selectedIcon: Icon(Icons.report),
          label: Text('Laporan'),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Pengaturan'),
        ),

        const Divider(
          indent: 28,
          endIndent: 28,
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            16,
            16,
            10,
          ),
          child: Text(
            'Menu Pendukung',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ListTile(
          leading: const Icon(
            Icons.info_outline,
          ),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              AppRoutes.tentang,
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.logout,
          ),
          title: const Text('Keluar'),
          onTap: () {
            Navigator.pop(context);
            _tampilkanDialogKeluar();
          },
        ),
      ],
    );
  }

  void _tampilkanDialogKeluar() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text(
            'Apakah Anda yakin ingin keluar '
            'dari aplikasi Mitigasi+?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur keluar masih dalam tahap pengembangan.',
                    ),
                  ),
                );
              },
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );
  }
}
