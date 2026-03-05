import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  int _mahasiswa = 0;
  int _dosen = 0;
  int _matakuliah = 0;

  int get mahasiswa => _mahasiswa;
  int get dosen => _dosen;
  int get matakuliah => _matakuliah;

  void tambahMahasiswa() {
    _mahasiswa++;
    notifyListeners();
  }

  void tambahDosen() {
    _dosen++;
    notifyListeners();
  }

  void tambahMatakuliah() {
    _matakuliah++;
    notifyListeners();
  }
}
