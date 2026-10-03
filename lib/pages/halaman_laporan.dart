import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanLaporan extends StatefulWidget {
  const HalamanLaporan({super.key});

  @override
  State<HalamanLaporan> createState() => _HalamanLaporanState();
}

class _HalamanLaporanState extends State<HalamanLaporan> {
  final List<Map<String, String>> _daftarLaporan = [
    {
      'namaBencana': 'Laporan Gempa Bumi',
      'lokasi': 'Kota Palu',
      'keterangan':
          'Laporan mengenai kondisi gempa bumi dan keadaan '
          'lingkungan di sekitar Kota Palu.',
    },
    {
      'namaBencana': 'Laporan Banjir',
      'lokasi': 'Kota Palu',
      'keterangan':
          'Laporan mengenai genangan atau banjir yang terjadi '
          'di wilayah Kota Palu.',
    },
    {
      'namaBencana': 'Laporan Kerusakan Fasilitas',
      'lokasi': 'Kota Palu',
      'keterangan':
          'Laporan mengenai fasilitas umum yang mengalami '
          'kerusakan akibat bencana.',
    },
  ];

  Future<void> _bukaDetail(
    Map<String, String> data,
  ) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detail,
      arguments: {
        'namaBencana': data['namaBencana']!,
        'lokasi': data['lokasi']!,
        'keterangan': data['keterangan']!,
      },
    );

    if (!mounted) {
      return;
    }

    if (hasil is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Laporan Bencana',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Pilih laporan untuk melihat informasi lebih lengkap.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 20),

        ..._daftarLaporan.map(
          (data) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Card(
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.report_outlined,
                      color: Colors.blue,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    data['namaBencana']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      data['lokasi']!,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    _bukaDetail(data);
                  },
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.orange.shade200,
            ),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.orange,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Gunakan fitur laporan untuk menyampaikan '
                  'informasi mengenai kondisi bencana di sekitar '
                  'Kota Palu.',
                  style: TextStyle(
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}