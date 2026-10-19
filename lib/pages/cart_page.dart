import 'package:flutter/material.dart';
import 'package:mysample/data/dummy/dummy_cart.dart';
import 'package:mysample/data/models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Format harga menjadi Rp 1.000.000
  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  // Menghitung subtotal semua barang
  int get totalBelanja {
    int total = 0;

    for (final item in cartItems) {
      total += item.harga * item.jumlah;
    }

    return total;
  }

  // Menambah jumlah barang
  void tambahJumlah(CartItem item) {
    setState(() {
      item.jumlah++;
    });
  }

  // Mengurangi jumlah barang
  void kurangJumlah(CartItem item) {
    setState(() {
      if (item.jumlah > 1) {
        item.jumlah--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Keranjang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // =========================
          // DAFTAR PRODUK
          // =========================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                final subtotal = item.harga * item.jumlah;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(12),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =========================
                        // GAMBAR
                        // =========================
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),

                          child: Image.network(
                            item.gambar,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,

                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        // =========================
                        // INFORMASI PRODUK
                        // =========================
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                item.nama,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItems.remove(item);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),

                              Text(
                                formatRupiah(item.harga),

                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                'Subtotal: ${formatRupiah(subtotal)}',

                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // =========================
                              // TOMBOL JUMLAH
                              // =========================
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  // Tombol -
                                  _quantityButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      kurangJumlah(item);
                                    },
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      '${item.jumlah}',

                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),

                                  // Tombol +
                                  _quantityButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      tambahJumlah(item);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // =========================
          // BAGIAN TOTAL
          // =========================
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),

            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),

            child: SafeArea(
              top: false,

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        'Total Belanja',

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        formatRupiah(totalBelanja),

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // =========================
                  // CHECKOUT
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Checkout berhasil diproses!'),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),

                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // BUTTON JUMLAH
  // =========================

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,

      borderRadius: BorderRadius.circular(8),

      child: Container(
        width: 30,
        height: 30,

        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Icon(icon, size: 18),
      ),
    );
  }
}
