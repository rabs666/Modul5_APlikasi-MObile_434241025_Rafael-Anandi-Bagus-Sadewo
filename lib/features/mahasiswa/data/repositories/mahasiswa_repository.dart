import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Balik ke data dummy Modul 4
    return [
      MahasiswaModel(
        nama: 'Rosalia',
        nim: '2024001',
        email: 'rosalia@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Anang',
        nim: '2024002',
        email: 'anang@example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}
