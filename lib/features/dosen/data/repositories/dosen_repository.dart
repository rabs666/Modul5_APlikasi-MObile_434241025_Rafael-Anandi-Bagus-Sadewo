import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/dosen_model.dart';

class DosenRepository {
  // Gunakan Dio secara langsung untuk menghindari error 'DioClient not found'
  final Dio _dio = Dio(BaseOptions(
    headers: {
      'User-Agent': 'Mozilla/5.0',
      'Accept': 'application/json',
    },
  ));

  /// Mendapatkan daftar dosen menggunakan DIO (Instruksi No. 7)
  Future<List<DosenModel>> getDosenWithDio() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users');
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } catch (e) {
      print('Dio Error: $e');
      // Jika Dio gagal, coba pakai Http sebagai cadangan
      return getDosenWithHttp();
    }
  }

  /// Mendapatkan daftar dosen menggunakan HTTP (Untuk perbandingan laporan)
  Future<List<DosenModel>> getDosenWithHttp() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Http Error: $e');
      throw Exception('Gagal memuat data dosen dari server');
    }
  }

  // Method utama yang dipanggil oleh provider
  Future<List<DosenModel>> getDosenList() => getDosenWithDio();
}
