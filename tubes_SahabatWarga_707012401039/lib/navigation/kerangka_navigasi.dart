import 'package:flutter/material.dart';

import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  void pindahHalaman(int indeks) {
    setState(() {
      indeksAktif = indeks;
    });

    switch (indeks) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.beranda);
        break;

      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.laporan);
        break;

      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.profil);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: indeksAktif,
      onDestinationSelected: pindahHalaman,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        NavigationDestination(
          icon: Icon(Icons.report_outlined),
          selectedIcon: Icon(Icons.report),
          label: 'Laporan',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}
