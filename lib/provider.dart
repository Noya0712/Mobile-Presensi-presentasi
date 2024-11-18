import 'package:flutter/material.dart';

class KehadiranProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _dataMahasiswa = [
    {'name': 'Holut Yudawan', 'presensi': false},
    {'name': 'Satrio Adi Baskoro', 'presensi': false},
    {'name': 'Moh. Faizin', 'presensi': false},
    {'name': 'Moh. Fatkur', 'presensi': false},
    {'name': 'Budiono Siregar', 'presensi': false},
    {'name': 'Citra Ackerman', 'presensi': false},
  ];

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get dataMahasiswa => _dataMahasiswa;
  List<Map<String, dynamic>> get history => _history;

  void toggleProvider(int index) {
    _dataMahasiswa[index]['presensi'] = !_dataMahasiswa[index]['presensi'];
    notifyListeners(); // Pastikan notifyListeners dipanggil
  }

  void saveKehadiran() {
    final now = DateTime.now();
    final jumlahMahasiswa =
        _dataMahasiswa.where((data) => data['presensi']).length;
    final absen = _dataMahasiswa.length - jumlahMahasiswa;

    _history.insert(0, {
      'date': '${now.day}-${now.month}-${now.year}',
      'data mahasiswa': jumlahMahasiswa,
      'absen': absen,
    });

    for (var dataMahasiswa in _dataMahasiswa) {
      dataMahasiswa['presensi'] = false;
    }

    notifyListeners();
  }
}
