import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio(BaseOptions(
    headers: {
      'User-Agent': 'Mozilla/5.0',
      'Accept': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  /// Mendapatkan daftar mahasiswa (comments) via DIO
  Future<List<MahasiswaModel>> getMahasiswaWithDio() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/comments');
      
      // Pada Dio, jika berhasil, data bisa langsung diakses
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } catch (e) {
      print('Dio Error (Mahasiswa): $e');
      // Jika Dio gagal, coba pakai HTTP sebagai cadangan
      return getMahasiswaWithHttp();
    }
  }

  /// Mendapatkan daftar mahasiswa via HTTP
  Future<List<MahasiswaModel>> getMahasiswaWithHttp() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
        headers: {'Accept': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Http Error (Mahasiswa): $e');
      throw Exception('Gagal memuat data mahasiswa dari semua library');
    }
  }

  Future<List<MahasiswaModel>> getMahasiswaList() => getMahasiswaWithDio();
}
