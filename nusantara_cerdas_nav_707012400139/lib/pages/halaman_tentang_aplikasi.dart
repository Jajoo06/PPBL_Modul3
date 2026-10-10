import 'package:flutter/material.dart';

class HalamanTentangAplikasi extends StatelessWidget {
  const HalamanTentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(
                Icons.account_balance,
                size: 88,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                'Nusantara Cerdas',
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Aplikasi demonstrasi layanan publik digital '
                'yang dirancang untuk memudahkan masyarakat '
                'mengakses informasi perizinan, kesehatan, '
                'transportasi, dan layanan warga.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Dibuat dengan Flutter'),
                  subtitle: Text('Material Design 3'),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Versi Aplikasi'),
                  subtitle: Text('1.0.0'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
