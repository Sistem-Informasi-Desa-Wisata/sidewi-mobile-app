import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/services/notifikasi_service.dart';
import 'package:sidewi_mobile_app/models/notifikasi_model.dart';

class NotifikasiViewModel extends ChangeNotifier {
  final NotifikasiService _notifikasiService = NotifikasiService();

  List<NotifikasiModel> _notifikasiHariIniList = [];
  List<NotifikasiModel> _notifikasiKemarinList = [];
  List<NotifikasiModel> _notifikasiLebihLamaList = [];

  bool _isLoading = false;
  String? _errorMessage;

  List<NotifikasiModel> get notifikasiHariIniList => _notifikasiHariIniList;
  List<NotifikasiModel> get notifikasiKemarinList => _notifikasiKemarinList;
  List<NotifikasiModel> get notifikasiLebihLamaList => _notifikasiLebihLamaList;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNotifikasiHariIniById(userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final notifikasiList =
          await _notifikasiService.fetchNotifikasiById(userId);
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = startOfDay.add(Duration(days: 1));

      _notifikasiHariIniList = notifikasiList.where((notifikasi) {
        return notifikasi.createdAt.isAfter(startOfDay) &&
            notifikasi.createdAt.isBefore(endOfDay);
      }).toList();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNotifikasiKemarinById(userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final notifikasiList =
          await _notifikasiService.fetchNotifikasiById(userId);
      final now = DateTime.now();
      final startOfYesterday =
          DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
      final endOfYesterday = startOfYesterday.add(Duration(days: 1));

      _notifikasiKemarinList = notifikasiList.where((notifikasi) {
        return notifikasi.createdAt.isAfter(startOfYesterday) &&
            notifikasi.createdAt.isBefore(endOfYesterday);
      }).toList();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNotifikasiLebihLamaById(userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final notifikasiList =
          await _notifikasiService.fetchNotifikasiById(userId);
      final now = DateTime.now();
      final startOfYesterday =
          DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));

      _notifikasiLebihLamaList = notifikasiList.where((notifikasi) {
        return notifikasi.createdAt.isBefore(startOfYesterday);
      }).toList();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllNotifikasiById(userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      fetchNotifikasiHariIniById(userId);
      fetchNotifikasiKemarinById(userId);
      fetchNotifikasiLebihLamaById(userId);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
