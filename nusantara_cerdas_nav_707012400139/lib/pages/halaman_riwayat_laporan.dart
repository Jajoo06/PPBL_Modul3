import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatefulWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  State<HalamanRiwayatLaporan> createState() => _HalamanRiwayatLaporanState();
}

class _HalamanRiwayatLaporanState extends State<HalamanRiwayatLaporan> {
  final List<String> _laporan = [
    'Lampu jalan tidak menyala',
    'Sampah menumpuk di lingkungan',
    'Kerusakan fasilitas umum',
  ];

  void _tambahLaporan() {
    setState(() {
      _laporan.insert(0, 'Laporan baru - ${_laporan.length + 1}');
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Laporan baru ditambahkan.')));
  }

  void _aksi(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: _laporan.isEmpty
          ? const Center(child: Text('Belum ada laporan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _laporan.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.description_outlined),
                    ),
                    title: Text(_laporan[index]),
                    subtitle: const Text('Status: Menunggu verifikasi'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _aksi('Anda memilih: ${_laporan[index]}');
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahLaporan,
        tooltip: 'Tambah laporan',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Beranda',
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.home_outlined),
            ),
            IconButton(
              tooltip: 'Filter laporan',
              onPressed: () {
                _aksi('Fitur filter laporan dipilih.');
              },
              icon: const Icon(Icons.filter_list),
            ),
            IconButton(
              tooltip: 'Cari laporan',
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: _PencarianLaporan(_laporan),
                );
              },
              icon: const Icon(Icons.search),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}

class _PencarianLaporan extends SearchDelegate<String> {
  final List<String> laporan;

  _PencarianLaporan(this.laporan);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, ''),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final hasil = laporan
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: hasil.map((item) => ListTile(title: Text(item))).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final hasil = laporan
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: hasil.map((item) => ListTile(title: Text(item))).toList(),
    );
  }
}
