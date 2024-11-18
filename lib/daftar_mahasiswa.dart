import 'package:flutter/material.dart';
import 'package:presensi_mobile/provider.dart';

class DaftarMahasiswa extends StatelessWidget {
  const DaftarMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context); // Mengakses Provider

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.dataMahasiswa.length,
              itemBuilder: (context, index) {
                final dataMahasiswa = provider.dataMahasiswa[index];
                return CheckboxListTile(
                  title: Text(dataMahasiswa['name']),
                  value: dataMahasiswa['presensi'],
                  onChanged: (_) => provider.toggleProvider(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
