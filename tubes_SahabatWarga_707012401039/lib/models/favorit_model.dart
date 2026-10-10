import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _daftarFavorit = {};

  Set<String> get daftarFavorit => Set.unmodifiable(_daftarFavorit);

  bool isFavorit(String judul) {
    return _daftarFavorit.contains(judul);
  }

  void toggleFavorit(String judul) {
    if (_daftarFavorit.contains(judul)) {
      _daftarFavorit.remove(judul);
    } else {
      _daftarFavorit.add(judul);
    }

    notifyListeners();
  }
}
