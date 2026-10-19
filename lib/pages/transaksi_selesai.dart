import 'package:flutter/material.dart';

class TransaksiSelesai extends StatefulWidget {
  final dynamic transaction;

  const TransaksiSelesai({
    super.key,
    required this.transaction,
  });

  @override
  State<TransaksiSelesai> createState() =>
      _TransaksiSelesaiState();
}

class _TransaksiSelesaiState
    extends State<TransaksiSelesai> {

  int rating = 0;

  final TextEditingController ulasanController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berikan Ulasan'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ===============================
            // PRODUK
            // ===============================

            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10),

                  child: Image.network(
                    widget.transaction.foto,

                    width: 70,
                    height: 70,

                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    widget.transaction.nama,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Bagaimana pengalamanmu?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ===============================
            // RATING BINTANG
            // ===============================

            Row(
              children: List.generate(
                5,
                (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        rating = index + 1;
                      });
                    },

                    icon: Icon(
                      index < rating
                          ? Icons.star
                          : Icons.star_border,

                      color: Colors.amber,

                      size: 35,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // ===============================
            // KOLOM ULASAN
            // ===============================

            TextField(
              controller: ulasanController,

              maxLines: 5,

              decoration: InputDecoration(
                hintText:
                    'Tulis ulasan produk...',

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ===============================
            // KIRIM ULASAN
            // ===============================

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (rating == 0) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Silakan pilih rating terlebih dahulu',
                        ),
                      ),
                    );

                    return;
                  }

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Ulasan berhasil dikirim!',
                      ),
                    ),
                  );
                },

                child: const Text(
                  'Kirim Ulasan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ulasanController.dispose();
    super.dispose();
  }
}