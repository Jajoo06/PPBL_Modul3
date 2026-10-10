import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Header Ruang Warga
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.people, size: 48),
              SizedBox(height: 12),
              Text(
                'Ruang Warga',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Akses informasi dan pantau aktivitas '
                'pelayanan masyarakat.',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Bagian Layanan Favorit
        Text('Layanan Favorit', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),

        Consumer<FavoritModel>(
          builder: (context, model, child) {
            final daftarFavorit = model.daftarFavorit;

            if (daftarFavorit.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.star_border, size: 40),
                      SizedBox(height: 8),
                      Text('Belum ada layanan favorit.'),
                      Text(
                        'Tandai layanan dengan ikon bintang '
                        'pada halaman Layanan.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Card(
              child: Column(
                children: daftarFavorit.map((nama) {
                  return ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: Text(nama),
                    trailing: IconButton(
                      tooltip: 'Hapus dari favorit',
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        context.read<FavoritModel>().batalTandai(nama);
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),

        const SizedBox(height: 24),

        // Bagian Keranjang Pengajuan
        Row(
          children: [
            Expanded(
              child: Text(
                'Keranjang Pengajuan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Consumer<PengajuanModel>(
              builder: (context, model, child) {
                return Chip(
                  avatar: const Icon(Icons.shopping_cart_outlined),
                  label: Text('${model.totalPengajuan} layanan'),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),

        Consumer<PengajuanModel>(
          builder: (context, model, child) {
            final daftar = model.daftarPengajuan;

            if (daftar.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 40),
                      SizedBox(height: 8),
                      Text('Belum ada pengajuan layanan.'),
                      Text(
                        'Buka rincian layanan dan tekan '
                        'Ajukan Permohonan.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Card(
              child: Column(
                children: daftar.map((layanan) {
                  return ListTile(
                    leading: const Icon(Icons.assignment_outlined),
                    title: Text(layanan['nama'] ?? 'Layanan'),
                    subtitle: Text(layanan['dinas'] ?? '-'),
                  );
                }).toList(),
              ),
            );
          },
        ),

        const SizedBox(height: 24),

        // Menu yang sudah ada tetap dipertahankan
        Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Laporan'),
            subtitle: const Text('Lihat laporan dan aktivitas warga'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.riwayatLaporan);
            },
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan Kota'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.pengaturanKota);
            },
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.tentangAplikasi);
            },
          ),
        ),
      ],
    );
  }
}
