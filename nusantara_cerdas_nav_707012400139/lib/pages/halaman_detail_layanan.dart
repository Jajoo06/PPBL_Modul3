import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
  final Map<String, String> dataLayanan;

  const HalamanDetailLayanan({super.key, required this.dataLayanan});

  @override
  State<HalamanDetailLayanan> createState() => _HalamanDetailLayananState();
}

class _HalamanDetailLayananState extends State<HalamanDetailLayanan> {
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    if (_sedangMengirim) return;

    setState(() {
      _sedangMengirim = true;
    });

    // Simulasi proses pengiriman selama 1 detik.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    // Simpan layanan ke model pengajuan.
    context.read<PengajuanModel>().tambahPengajuan(widget.dataLayanan);

    final namaLayanan = widget.dataLayanan['nama'] ?? 'Layanan';

    // Kembalikan hasil ke halaman Layanan.
    Navigator.pop(context, 'Permohonan $namaLayanan berhasil diajukan.');
  }

  @override
  Widget build(BuildContext context) {
    final dataLayanan = widget.dataLayanan;

    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),

          Text(
            dataLayanan['nama'] ?? 'Nama layanan',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          _informasi(
            Icons.account_balance_outlined,
            'Dinas Penanggung Jawab',
            dataLayanan['dinas'] ?? '-',
          ),

          _informasi(
            Icons.access_time,
            'Jam Operasional',
            dataLayanan['jam'] ?? '-',
          ),

          _informasi(
            Icons.info_outline,
            'Keterangan',
            dataLayanan['keterangan'] ?? '-',
          ),

          const SizedBox(height: 24),

          FilledButton.icon(
            onPressed: _sedangMengirim ? null : _ajukanPermohonan,
            icon: _sedangMengirim
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(
              _sedangMengirim ? 'Sedang Mengirim...' : 'Ajukan Permohonan',
            ),
          ),

          const SizedBox(height: 8),

          OutlinedButton(
            onPressed: _sedangMengirim ? null : () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  Widget _informasi(IconData ikon, String judul, String isi) {
    return Card(
      child: ListTile(
        leading: Icon(ikon),
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isi),
      ),
    );
  }
}
