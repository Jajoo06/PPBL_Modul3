import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final jumlahFavorit = context.select<FavoritModel, int>(
      (model) => model.daftarFavorit.length,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sahabat Warga'), centerTitle: true),

      drawer: NavigationDrawer(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 32, 16, 16),
            child: Text(
              'Sahabat Warga',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          NavigationDrawerDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: const Text('Beranda'),
            enabled: true,
          ),

          NavigationDrawerDestination(
            icon: const Icon(Icons.report_outlined),
            selectedIcon: const Icon(Icons.report),
            label: const Text('Laporan'),
            enabled: true,
          ),

          NavigationDrawerDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: const Text('Profil'),
            enabled: true,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),

          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.pengaturan);
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.tentang);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Sampaikan laporan dan informasi mengenai '
              'masalah di lingkunganmu.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // Kartu jumlah laporan favorit dari Provider.
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 32,
                ),
                title: const Text(
                  'Laporan Favorit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Jumlah laporan yang kamu tandai sebagai favorit.',
                ),
                trailing: CircleAvatar(child: Text('$jumlahFavorit')),
              ),
            ),

            const SizedBox(height: 16),

            // Kartu menu laporan.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.campaign, size: 40),

                    const SizedBox(height: 12),

                    const Text(
                      'Buat Laporan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Laporkan kejadian atau masalah yang terjadi '
                      'di lingkungan sekitar.',
                    ),

                    const SizedBox(height: 16),

                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.laporan);
                      },
                      icon: const Icon(Icons.report),
                      label: const Text('Lihat Laporan'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.laporan);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, AppRoutes.profil);
          }
        },
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
      ),
    );
  }
}
