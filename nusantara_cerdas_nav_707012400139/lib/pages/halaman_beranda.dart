import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_balance,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Selamat Datang!',
                style: Theme.of(context)
                    .textTheme.headlineMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Nusantara Cerdas membantu Anda '
                'mengakses informasi dan layanan publik '
                'dengan mudah dalam satu aplikasi.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Akses Cepat',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.miscellaneous_services),
            title: const Text('Jelajahi Layanan'),
            subtitle: const Text(
              'Perizinan, kesehatan, dan transportasi',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/route-tidak-terdaftar',
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Laporan'),
            subtitle: const Text(
              'Lihat aktivitas dan laporan warga',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.riwayatLaporan,
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.tentangAplikasi,
              );
            },
          ),
        ),
      ],
    );
  }
}