import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanMitigasi extends StatelessWidget {
  const HalamanMitigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: Colors.white,
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.vibration),
                  text: 'Gempa',
                ),
                Tab(
                  icon: Icon(Icons.waves),
                  text: 'Tsunami',
                ),
                Tab(
                  icon: Icon(Icons.water),
                  text: 'Banjir',
                ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                _daftarBencana(
                  context,
                  [
                    {
                      'nama': 'Gempa Bumi',
                      'lokasi': 'Kota Palu',
                      'keterangan':
                          'Gempa bumi dapat terjadi secara tiba-tiba. '
                          'Segera berlindung di tempat yang aman, '
                          'jauhi kaca dan benda yang mudah jatuh.',
                    },
                    {
                      'nama': 'Gempa Saat Berada di Dalam Rumah',
                      'lokasi': 'Rumah atau Bangunan',
                      'keterangan':
                          'Berlindung di bawah meja yang kokoh, '
                          'jauhkan diri dari jendela, kemudian keluar '
                          'setelah guncangan berhenti.',
                    },
                    {
                      'nama': 'Gempa Saat Berada di Luar',
                      'lokasi': 'Area Terbuka',
                      'keterangan':
                          'Jauhi bangunan, tiang listrik, pohon, '
                          'dan benda lain yang dapat roboh.',
                    },
                  ],
                ),

                _daftarBencana(
                  context,
                  [
                    {
                      'nama': 'Tsunami',
                      'lokasi': 'Wilayah Pesisir Kota Palu',
                      'keterangan':
                          'Jika terjadi gempa kuat dan berlangsung lama '
                          'di wilayah pesisir, segera menuju tempat '
                          'yang lebih tinggi.',
                    },
                    {
                      'nama': 'Evakuasi Tsunami',
                      'lokasi': 'Jalur Evakuasi',
                      'keterangan':
                          'Ikuti jalur evakuasi dan petunjuk petugas. '
                          'Jangan kembali ke rumah sebelum dinyatakan aman.',
                    },
                    {
                      'nama': 'Tanda-Tanda Tsunami',
                      'lokasi': 'Wilayah Pesisir',
                      'keterangan':
                          'Perhatikan perubahan kondisi laut setelah '
                          'gempa dan ikuti informasi resmi dari pihak berwenang.',
                    },
                  ],
                ),

                _daftarBencana(
                  context,
                  [
                    {
                      'nama': 'Banjir',
                      'lokasi': 'Kota Palu',
                      'keterangan':
                          'Hindari daerah yang tergenang dan segera '
                          'menuju tempat yang lebih tinggi apabila '
                          'air mulai naik.',
                    },
                    {
                      'nama': 'Persiapan Menghadapi Banjir',
                      'lokasi': 'Rumah',
                      'keterangan':
                          'Simpan dokumen penting dan barang berharga '
                          'di tempat yang lebih tinggi serta siapkan '
                          'kebutuhan darurat.',
                    },
                    {
                      'nama': 'Evakuasi Saat Banjir',
                      'lokasi': 'Daerah Terdampak',
                      'keterangan':
                          'Ikuti arahan petugas dan gunakan jalur '
                          'evakuasi yang telah ditentukan.',
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _daftarBencana(
    BuildContext context,
    List<Map<String, String>> daftar,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: daftar.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final data = daftar[index];

        return Card(
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.shield_outlined,
                color: Colors.blue,
                size: 28,
              ),
            ),
            title: Text(
              data['nama']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
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
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: {
                  'namaBencana': data['nama']!,
                  'lokasi': data['lokasi']!,
                  'keterangan': data['keterangan']!,
                },
              );
            },
          ),
        );
      },
    );
  }
}