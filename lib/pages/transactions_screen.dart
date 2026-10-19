import 'package:flutter/material.dart';
import 'package:mysample/data/dummy/dummy_transactions.dart';
import 'package:mysample/widgets/my_app_bar.dart';

import 'detail_transaksi.dart';
import 'transaksi_dikirim.dart';
import 'transaksi_selesai.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  // ===============================
  // FORMAT HARGA RUPIAH
  // ===============================

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  // ===============================
  // WARNA STATUS
  // ===============================

  Color getStatusColor(String status) {
    switch (status) {
      case 'Selesai':
        return Colors.green;

      case 'Dikirim':
        return Colors.blue;

      case 'Dikemas':
        return Colors.orange;

      case 'Diproses':
        return Colors.purple;

      case 'Dibatalkan':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  // ===============================
  // TOMBOL TRANSAKSI
  // ===============================

  void handleTransactionAction(BuildContext context, dynamic item) {
    switch (item.status) {
      // =========================
      // SELESAI
      // =========================
      case 'Selesai':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransaksiSelesai(transaction: item),
          ),
        );
        break;

      // =========================
      // DIKIRIM
      // =========================
      case 'Dikirim':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransaksiDikirim(transaction: item),
          ),
        );
        break;

      // =========================
      // DIPROSES & DIKEMAS
      // =========================
      case 'Diproses':
      case 'Dikemas':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTransaksi(transaction: item),
          ),
        );
        break;

      // =========================
      // DIBATALKAN
      // =========================
      case 'Dibatalkan':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTransaksi(transaction: item),
          ),
        );
        break;
    }
  }

  // ===============================
  // TEXT TOMBOL
  // ===============================

  String getButtonText(String status) {
    switch (status) {
      case 'Selesai':
        return 'Berikan Ulasan';

      case 'Dikirim':
        return 'Lacak';

      case 'Diproses':
      case 'Dikemas':
      case 'Dibatalkan':
        return 'Detail';

      default:
        return 'Detail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),

      body: ListView.builder(
        itemCount: transactions.length,

        itemBuilder: (context, index) {
          final item = transactions[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

            elevation: 2,

            shadowColor: Colors.black.withOpacity(0.08),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),

              side: BorderSide(color: Colors.grey.shade200),
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ===============================
                  // TANGGAL & STATUS
                  // ===============================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        item.tanggal,

                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: getStatusColor(item.status).withAlpha(25),

                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(
                            color: getStatusColor(item.status).withAlpha(150),
                          ),
                        ),

                        child: Text(
                          item.status,

                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: getStatusColor(item.status),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Divider(),

                  const SizedBox(height: 12),

                  // ===============================
                  // PRODUK
                  // ===============================
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),

                        child: Image.network(
                          item.foto,

                          width: 60,
                          height: 60,

                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60,
                              height: 60,

                              color: Colors.grey.shade200,

                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              item.nama,

                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              '1 barang',

                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ===============================
                  // TOTAL & TOMBOL
                  // ===============================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Total Belanja',

                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            formatRupiah(item.harga),

                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      OutlinedButton(
                        onPressed: () {
                          handleTransactionAction(context, item);
                        },

                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: Text(
                          getButtonText(item.status),

                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
