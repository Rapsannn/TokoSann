import 'package:flutter/material.dart';
import 'package:mysample/pages/session_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Menyimpan username dari session
  String _username = 'Rapsan';

  // ==============================
  // MENGAMBIL USERNAME
  // ==============================

  Future<void> loadUser() async {
    final user = await SessionService.getUsername();

    if (!mounted) return;

    setState(() {
      _username = user;
    });
  }

  // ==============================
  // LOGOUT
  // ==============================

  Future<void> logout() async {
    // Hapus session
    await SessionService.logout();

    if (!mounted) return;

    // Kembali ke halaman login
    // dan menghapus halaman sebelumnya dari stack
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();

    // Ambil username ketika halaman dibuka
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==============================
      // APP BAR
      // ==============================
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      // ==============================
      // BODY
      // ==============================
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),

        child: Column(
          children: [
            const SizedBox(height: 25),

            // ==============================
            // FOTO PROFILE
            // ==============================
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color(0xFFE8F3F8),

              child: CircleAvatar(
                radius: 60,

                // Karena gambar berasal dari assets
                backgroundImage: const AssetImage('assets/images/monyed.jpg'),
              ),
            ),

            const SizedBox(height: 15),

            // ==============================
            // USERNAME
            // ==============================
            Text(
              _username.isEmpty ? 'Loading...' : _username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),

            const SizedBox(height: 35),

            // ==============================
            // EMAIL
            // ==============================
            profileItem(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'Rapsann@gmail.com',
            ),

            const SizedBox(height: 15),

            // ==============================
            // NO HP
            // ==============================
            profileItem(
              icon: Icons.phone_outlined,
              title: 'No. HP',
              value: '+62 812-3456-7890',
            ),

            const SizedBox(height: 15),

            // SOCIAL MEDIA
            profileItem(
              icon: Icons.public,
              title: 'Social Media',
              value: '@Zbadeboo',
            ),

            const SizedBox(height: 30),

            // TOMBOL LOGOUT
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: logout,
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ==============================
  // COMPONENT PROFILE ITEM
  // ==============================

  Widget profileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: const Color(0xFFE8F3F8),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(icon, color: const Color(0xFF005A9C)),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
