import 'package:flutter/material.dart';

class MallScreen extends StatelessWidget {
  const MallScreen({super.key});

  final List<Map<String, dynamic>> stores = const [
    {
      'name': 'Zara',
      'location': 'Lantai 1',
      'category': 'Fashion',
      'rating': 4.8,
      'image':
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=500',
    },
    {
      'name': 'Nike Store',
      'location': 'Lantai 1',
      'category': 'Sports',
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=500',
    },
    {
      'name': 'Starbucks',
      'location': 'Lantai 2',
      'category': 'Food & Drink',
      'rating': 4.9,
      'image':
          'https://images.unsplash.com/photo-1445116572660-236099ec97a0?w=500',
    },
    {
      'name': 'Uniqlo',
      'location': 'Lantai 2',
      'category': 'Fashion',
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=500',
    },
    {
      'name': 'Adidas',
      'location': 'Lantai 1',
      'category': 'Sports',
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=500',
    },
    {
      'name': 'KFC',
      'location': 'Lantai 2',
      'category': 'Food & Drink',
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1513639776629-7b61b0ac49cb?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mall',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Temukan toko favoritmu',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                // Icon notifikasi
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notifications_none, size: 24),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Cari toko...',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Semua Toko',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Grid toko
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.72,
                ),
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar toko
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                          child: Image.network(
                            store['image'],
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 130,
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.store,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),

                        // Informasi toko
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              // Lokasi
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 3),
                                  Expanded(
                                    child: Text(
                                      store['location'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              // Rating + kategori
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 17,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        '${store['rating']}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      store['category'],
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
