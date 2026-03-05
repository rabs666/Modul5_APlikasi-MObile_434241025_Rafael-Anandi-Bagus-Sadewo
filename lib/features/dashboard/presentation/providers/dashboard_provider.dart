import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dashboard_model.dart';

// Notifier untuk mengelola state dashboard
class DashboardNotifier extends StateNotifier<AsyncValue<DashboardData>> {
  DashboardNotifier() : super(const AsyncValue.loading()) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    state = const AsyncValue.loading();
    try {
      // Simulasi fetch data dari API
      await Future.delayed(const Duration(milliseconds: 800));
      
      final stats = [
        DashboardStats(
          title: "Total Mahasiswa", 
          value: "1,234", 
          subtitle: "8.5% Mahasiswa terdaf...", 
          percentage: 8.5, 
          isIncrease: true
        ),
        DashboardStats(
          title: "Mahasiswa Aktif", 
          value: "1,180", 
          subtitle: "5.2% Sedang kuliah", 
          percentage: 5.2, 
          isIncrease: true
        ),
        DashboardStats(
          title: "Jumlah Kelas", 
          value: "48", 
          subtitle: "2.1% Kelas semester ini", 
          percentage: 2.1, 
          isIncrease: false
        ),
        DashboardStats(
          title: "Tingkat Kelulusan", 
          value: "94%", 
          subtitle: "3.5% Tahun ini", 
          percentage: 3.5, 
          isIncrease: true
        ),
      ];

      final data = DashboardData(
        userName: "Admin D4TI",
        stats: stats,
        lastUpdate: DateTime.now(),
      );
      
      state = AsyncValue.data(data);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    await _fetchData();
  }
}

// Provider untuk DashboardNotifier
final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardData>>((ref) {
  return DashboardNotifier();
});

// Provider untuk index yang dipilih
// Set index 0 agar kartu pertama terpilih seperti di gambar
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);
