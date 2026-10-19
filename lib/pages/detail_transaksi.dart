import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  final dynamic transaction;

  const DetailTransaksi({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ===============================
            // STATUS
            // ===============================

            Text(
              transaction.status,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ===============================
            // PRODUK
            // ===============================

            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.network(
                    transaction.foto,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    transaction.nama,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 16),

            const Text(
              'Informasi Pesanan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Tanggal: ${transaction.tanggal}',
            ),

            const SizedBox(height: 8),

            Text(
              'Total: Rp ${transaction.harga}',
            ),

            const SizedBox(height: 8),

            Text(
              'Status: ${transaction.status}',
            ),
          ],
        ),
      ),
    );
  }
}