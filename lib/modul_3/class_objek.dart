import 'dart:io';

// --- 1. DEFINISI MIXIN ---
mixin PencetakKartu {
  void cetakKartu(String nama) {
    print("ID CARD: Mencetak kartu identitas untuk $nama...");
  }
}

mixin Penilaian {
  void inputNilai(String namaMhs, double nilai) {
    print("NILAI: Memberikan nilai $nilai kepada mahasiswa: $namaMhs.");
  }
}

mixin Pengumuman {
  void sebarInfo(String info) {
    print("PENGUMUMAN: [INFO FAKULTAS] -> $info");
  }
}

// --- 2. CLASS DASAR ---
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  Mahasiswa(this.nama, this.nim, [this.jurusan]);

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

// --- 3. CLASS DENGAN INHERITANCE & MIXIN ---

// Dosen extends Mahasiswa (menganggap dosen juga punya data dasar seperti nama/id)
class Dosen extends Mahasiswa with PencetakKartu, Penilaian {
  Dosen(String nama, int id) : super(nama, id);

  void sapaMahasiswa() {
    print("Halo, saya dosen pengampu mata kuliah ini.");
  }
}

// Fakultas extends Mahasiswa (sesuai permintaan tugas)
class Fakultas extends Mahasiswa with Pengumuman {
  Fakultas(String namaFakultas) : super(namaFakultas, 0);

  void infoFakultas() {
    print("Selamat datang di $nama.");
  }
}

class MahasiswaAktif extends Mahasiswa with PencetakKartu {
  int semester;

  MahasiswaAktif(String nama, int nim, this.semester) : super(nama, nim);

  void tampilkanSemester() {
    print("Status: Mahasiswa Aktif di semester $semester");
  }
}

void main() {
  print("=== PROGRAM MIXIN & INHERITANCE ===\n");

  // 1. Contoh Mahasiswa Aktif (Punya mixin PencetakKartu)
  var mhs1 = MahasiswaAktif("Rosalia", 2024001, 3);
  mhs1.tampilkanData();
  mhs1.cetakKartu(mhs1.nama!); // Dari Mixin PencetakKartu

  print("-" * 30);

  // 2. Contoh Dosen (Punya mixin PencetakKartu dan Penilaian)
  var dosen = Dosen("Dr. Anang", 19800101);
  dosen.tampilkanData();
  dosen.cetakKartu(dosen.nama!); // Dari Mixin PencetakKartu
  dosen.inputNilai("Rosalia", 90.5); // Dari Mixin Penilaian

  print("-" * 30);

  // 3. Contoh Fakultas (Punya mixin Pengumuman)
  var fk = Fakultas("Fakultas Teknik Informatika");
  fk.infoFakultas();
  fk.sebarInfo("Pendaftaran beasiswa telah dibuka!"); // Dari Mixin Pengumuman
}
