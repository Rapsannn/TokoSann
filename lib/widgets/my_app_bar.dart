import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      surfaceTintColor: Colors.transparent,

      titleSpacing: 16,

      title: Row(
        children: [
          // =====================
          // SEARCH BAR
          // =====================
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk...',
                  prefixIcon: const Icon(Icons.search, size: 22),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // =====================
          // ICON CHAT
          // =====================
          IconButton(
            onPressed: () {
              // Aksi chat
            },
            icon: const Icon(Icons.chat_bubble_outline),
          ),

          // =====================
          // ICON KERANJANG
          // =====================
          IconButton(
            onPressed: () {
              // Aksi keranjang
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
