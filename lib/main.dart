import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bencana_model.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BencanaModel(),
      child: const AplikasiMitigasi(),
    ),
  );
}

class AplikasiMitigasi extends StatelessWidget {
  const AplikasiMitigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitigasi+ Kota Palu',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      initialRoute: AppRoutes.beranda,

      routes: AppRoutes.daftarRoute(),

      onGenerateRoute: AppRoutes.bentukRoute,

      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}