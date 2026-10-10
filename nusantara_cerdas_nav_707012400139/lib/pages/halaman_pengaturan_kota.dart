import 'package:flutter/material.dart';

class HalamanPengaturanKota extends StatefulWidget {
  const HalamanPengaturanKota({super.key});

  @override
  State<HalamanPengaturanKota> createState() => _HalamanPengaturanKotaState();
}

class _HalamanPengaturanKotaState extends State<HalamanPengaturanKota> {
  bool _notifikasi = true;
  bool _modeHemat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Preferensi Aplikasi'),
            subtitle: Text('Atur pengalaman penggunaan aplikasi.'),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('Notifikasi'),
            subtitle: const Text('Terima informasi layanan dan laporan.'),
            value: _notifikasi,
            onChanged: (nilai) {
              setState(() {
                _notifikasi = nilai;
              });
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.battery_saver),
            title: const Text('Mode Hemat'),
            subtitle: const Text('Preferensi penggunaan aplikasi.'),
            value: _modeHemat,
            onChanged: (nilai) {
              setState(() {
                _modeHemat = nilai;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            subtitle: const Text('Bahasa Indonesia'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bahasa Indonesia sedang digunakan.'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
