import 'package:flutter/material.dart';
import 'package:presensi_mobile/provider.dart';

class DaftarPresensi extends StatelessWidget {
  const DaftarPresensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Presensi')),
      body: provider.history.isEmpty
          ? const Center(child: Text('Belum Presensi'))
          : ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          final record = provider.history[index];
          return ListTile(
            title: Text(record['date']),
            subtitle: Text(
              'Hadir: ${record['data mahasiswa']}, Tidak Hadir: ${record['absen']}',
            ),
          );
        },
      ),
    );
  }
}

