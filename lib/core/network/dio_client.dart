/// delete user tertentu dari list
Future<void> removeSavedUser(String userId) async {
  final prefs = await SharedPreferences.getInstance();
  final rawList = prefs.getStringList(_savedUsersKey) ?? [];

  rawList.removeWhere((item) {
    final map = jsonDecode(item) as Map<String, dynamic>;
    return map['user_id'] == userId;
  });

  await prefs.setStringList(_savedUsersKey, rawList);
}

/// delete semua user dari list
Future<void> clearSavedUsers() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_savedUsersKey);
}

// --- Clear All preferences---
Future<void> clearAll() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
}