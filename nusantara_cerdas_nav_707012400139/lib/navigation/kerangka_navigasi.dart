import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksAktif = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> _judul = const ['Beranda', 'Layanan', 'Warga'];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksAktif = indeks;
    });
  }

  void _bukaMenuPendukung(String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  // Menampilkan ikon Warga dengan badge jumlah pengajuan.
  Widget _ikonWarga({required BuildContext context, required bool terpilih}) {
    final total = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Badge(
      isLabelVisible: total > 0,
      label: Text(total.toString()),
      child: Icon(terpilih ? Icons.people : Icons.people_outline),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final layarLebar = lebar >= 600;

    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksAktif]), centerTitle: false),

      drawer: NavigationDrawer(
        selectedIndex: _indeksAktif,
        onDestinationSelected: (indeks) {
          if (indeks < 3) {
            Navigator.pop(context);
            _pilihTujuan(indeks);
          } else {
            switch (indeks) {
              case 3:
                _bukaMenuPendukung(AppRoutes.pengaturanKota);
                break;
              case 4:
                _bukaMenuPendukung(AppRoutes.tentangAplikasi);
                break;
              case 5:
                _bukaMenuPendukung(AppRoutes.keluar);
                break;
            }
          }
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 12),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Nusantara Cerdas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.miscellaneous_services_outlined),
            selectedIcon: Icon(Icons.miscellaneous_services),
            label: Text('Layanan'),
          ),
          NavigationDrawerDestination(
            icon: _ikonWarga(context: context, terpilih: false),
            selectedIcon: _ikonWarga(context: context, terpilih: true),
            label: const Text('Warga'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 8),
            child: Text('Menu Pendukung'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: Text('Pengaturan Kota'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: Text('Tentang Aplikasi'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            selectedIcon: Icon(Icons.logout),
            label: Text('Keluar'),
          ),
        ],
      ),

      body: Row(
        children: [
          if (layarLebar)
            NavigationRail(
              selectedIndex: _indeksAktif,
              onDestinationSelected: _pilihTujuan,
              labelType: NavigationRailLabelType.all,
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Icon(Icons.account_balance, size: 30),
              ),
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.miscellaneous_services_outlined),
                  selectedIcon: Icon(Icons.miscellaneous_services),
                  label: Text('Layanan'),
                ),
                NavigationRailDestination(
                  icon: _ikonWarga(context: context, terpilih: false),
                  selectedIcon: _ikonWarga(context: context, terpilih: true),
                  label: const Text('Warga'),
                ),
              ],
            ),

          if (layarLebar) const VerticalDivider(width: 1),

          Expanded(
            child: IndexedStack(index: _indeksAktif, children: _halaman),
          ),
        ],
      ),

      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: _indeksAktif,
              onDestinationSelected: _pilihTujuan,
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.miscellaneous_services_outlined),
                  selectedIcon: Icon(Icons.miscellaneous_services),
                  label: 'Layanan',
                ),
                NavigationDestination(
                  icon: _ikonWarga(context: context, terpilih: false),
                  selectedIcon: _ikonWarga(context: context, terpilih: true),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }
}
