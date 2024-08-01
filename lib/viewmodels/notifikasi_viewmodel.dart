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
      final startOfDay = DateTime(now.year, now.month, now.day).toLocal();

      _notifikasiHariIniList = notifikasiList.where((notifikasi) {
        final createdAt = notifikasi.createdAt.toUtc().toLocal();
        return createdAt.isAfter(startOfDay);
      }).toList();

      // Sort in descending order
      _notifikasiHariIniList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
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
      final startOfDay = DateTime(now.year, now.month, now.day).toLocal();
      final startOfYesterday = startOfDay.subtract(Duration(days: 1));

      _notifikasiKemarinList = notifikasiList.where((notifikasi) {
        final createdAt = notifikasi.createdAt.toUtc().toLocal();
        return createdAt.isAfter(startOfYesterday) &&
            createdAt.isBefore(startOfDay);
      }).toList();

      // Sort in descending order
      _notifikasiKemarinList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
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
      final startOfDay = DateTime(now.year, now.month, now.day).toLocal();
      final startOfYesterday = startOfDay.subtract(Duration(days: 1));

      _notifikasiLebihLamaList = notifikasiList.where((notifikasi) {
        final createdAt = notifikasi.createdAt.toUtc().toLocal();
        return createdAt.isBefore(startOfYesterday);
      }).toList();

      // Sort in descending order
      _notifikasiLebihLamaList
          .sort((a, b) => b.createdAt.compareTo(a.createdAt));
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

  Future<void> addNotifikasi(int id_akun, String deskripsi) async {
    try {
      await _notifikasiService.addNotifikasi(id_akun, deskripsi);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
