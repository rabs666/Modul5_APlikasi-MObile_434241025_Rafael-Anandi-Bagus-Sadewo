import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio(BaseOptions(
    headers: {'User-Agent': 'Mozilla/5.0'},
  ));

  /// Mendapatkan daftar mahasiswa (comments) via DIO
  Future<List<MahasiswaModel>> getMahasiswaWithDio() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/comments');
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } catch (e) {
      return getMahasiswaWithHttp();
    }
  }

  /// Mendapatkan daftar mahasiswa via HTTP
  Future<List<MahasiswaModel>> getMahasiswaWithHttp() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<List<MahasiswaModel>> getMahasiswaList() => getMahasiswaWithDio();
}
