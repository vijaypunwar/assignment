import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class UserProvider extends ChangeNotifier {
  List<dynamic> users = [];
  bool isLoading = false;
  int currentPage = 1;

  final Dio _dio = Dio();

  UserProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    final url =
        'https://randomuser.me/api/?page=$currentPage&results=10&seed=datinglist';
    try {
      final response = await _dio.get(url);
      final List newUsers = response.data['results'];
      users.addAll(newUsers);
      currentPage++;
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
