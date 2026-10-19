import 'package:flutter/material.dart';

class TransaksiDikirim extends StatelessWidget {
  final dynamic transaction;

  const TransaksiDikirim({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lacak Pesanan'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Pesanan Sedang Dikirim 🚚',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              transaction.nama,

              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // ===============================
            // TRACKING
            // ===============================

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),

              title: Text(
                'Pesanan telah diproses',
              ),

              subtitle: Text(
                'Pesanan berhasil diproses oleh toko',
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),

              title: Text(
                'Pesanan telah dikirim',
              ),

              subtitle: Text(
                'Pesanan sedang dalam perjalanan',
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.local_shipping,
                color: Colors.blue,
              ),

              title: Text(
                'Sedang dalam perjalanan',
              ),

              subtitle: Text(
                'Kurir sedang membawa pesanan kamu',
              ),
            ),
          ],
        ),
      ),
    );
  }
} 