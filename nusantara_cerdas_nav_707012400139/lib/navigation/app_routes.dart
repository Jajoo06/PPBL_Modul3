import 'package:flutter/material.dart';

import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_pengaturan_kota.dart';
import '../pages/halaman_tentang_aplikasi.dart';
import '../pages/halaman_riwayat_laporan.dart';
import '../pages/halaman_route_tidak_dikenal.dart';
import '../pages/halaman_keluar.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String keluar = '/keluar';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {beranda: (context) => const KerangkaNavigasi()};
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailLayanan:
        final arguments = settings.arguments;

        if (arguments is Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) {
              return HalamanDetailLayanan(dataLayanan: arguments);
            },
          );
        }

        return MaterialPageRoute(
          builder: (context) {
            return const HalamanRouteTidakDikenal(
              namaRoute: 'Data layanan tidak valid',
            );
          },
        );

      case pengaturanKota:
        return MaterialPageRoute(
          builder: (context) {
            return const HalamanPengaturanKota();
          },
        );

      case tentangAplikasi:
        return MaterialPageRoute(
          builder: (context) {
            return const HalamanTentangAplikasi();
          },
        );

      case riwayatLaporan:
        return MaterialPageRoute(
          builder: (context) {
            return const HalamanRiwayatLaporan();
          },
        );

      case keluar:
        return MaterialPageRoute(
          builder: (context) {
            return const HalamanKeluar();
          },
        );

      default:
        return null;
    }
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return HalamanRouteTidakDikenal(
          namaRoute: settings.name ?? 'Route tidak dikenal',
        );
      },
    );
  }
}
