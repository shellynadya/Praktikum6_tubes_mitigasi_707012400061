import 'package:flutter/material.dart';

import '../pages/halaman_detail.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detail = '/detail';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final argumen =
          settings.arguments as Map<String, String>? ?? {};

      return MaterialPageRoute(
        builder: (context) => HalamanDetail(
          namaBencana:
              argumen['namaBencana'] ?? 'Bencana',
          lokasi:
              argumen['lokasi'] ?? 'Kota Palu',
          keterangan:
              argumen['keterangan'] ??
                  'Tidak ada keterangan.',
        ),
      );
    }

    return null;
  }

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Halaman Tidak Ditemukan'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Route Tidak Ditemukan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Route "${settings.name}" '
                    'tidak tersedia.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.beranda,
                        (route) => false,
                      );
                    },
                    child: const Text('Kembali ke Beranda'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}