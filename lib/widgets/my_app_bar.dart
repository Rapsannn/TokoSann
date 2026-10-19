import 'package:flutter/material.dart';
import 'package:mysample/pages/cart_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      titleSpacing: 16,

      title: Row(
        children: [
          // =========================
          // SEARCH BAR
          // =========================
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search, size: 22),

                filled: true,
                fillColor: Colors.grey.shade100,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),

                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // =========================
          // CHAT
          // =========================
          IconButton(
            onPressed: () {
              // nanti bisa diarahkan ke halaman chat
            },
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
          ),

          // =========================
          // KERANJANG
          // =========================
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
