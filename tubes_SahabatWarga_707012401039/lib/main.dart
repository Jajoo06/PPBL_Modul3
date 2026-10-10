import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

import 'package:provider/provider.dart';

import 'models/favorit_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritModel(),
      child: const AplikasiSahabatWarga(),
    ),
  );
}

class AplikasiSahabatWarga extends StatelessWidget {
  const AplikasiSahabatWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahabat Warga',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
