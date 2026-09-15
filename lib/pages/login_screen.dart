import 'package:flutter/material.dart';

import 'register_screen.dart';

// ===============================
// LOGIN SCREEN
// ===============================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengambil isi username
  final TextEditingController usernameController = TextEditingController();

  // Controller untuk mengambil isi password
  final TextEditingController passwordController = TextEditingController();

  // Untuk mengatur apakah password terlihat atau tidak
  bool isPasswordVisible = false;

  // ===============================
  // FUNGSI LOGIN
  // ===============================

  void login() {
    // Mengambil isi username
    String username = usernameController.text;

    // Mengambil isi password
    String password = passwordController.text;

    // Login dummy
    if (username == 'admin' && password == '12345') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Jika salah, tampilkan pesan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===============================
              // LOGO
              // ===============================
              Center(
                child: Container(
                  width: 80,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ===============================
              // JUDUL
              // ===============================
              const Center(
                child: Text(
                  'Selamat Datang 👋',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  'Masuk untuk melanjutkan belanja',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),

              const SizedBox(height: 35),

              // ===============================
              // USERNAME
              // ===============================
              const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: usernameController,

                decoration: InputDecoration(
                  hintText: 'Masukkan username',

                  prefixIcon: const Icon(Icons.person_outline),

                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ===============================
              // PASSWORD
              // ===============================
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: passwordController,

                // Password disembunyikan
                obscureText: !isPasswordVisible,

                decoration: InputDecoration(
                  hintText: 'Masukkan password',

                  prefixIcon: const Icon(Icons.lock_outline),

                  // Tombol untuk melihat password
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },

                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),

                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ===============================
              // TOMBOL LOGIN
              // ===============================
              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    'Masuk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ===============================
              // REGISTER
              // ===============================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun? ',
                    style: TextStyle(color: Colors.grey),
                  ),

                  TextButton(
                    onPressed: () {
                      // Pindah ke halaman register
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },

                    child: const Text(
                      'Daftar sekarang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===============================
              // AKUN DUMMY
              // ===============================
              Center(
                child: Text(
                  'Demo: admin / 12345',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===============================
  // DISPOSE
  // ===============================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
