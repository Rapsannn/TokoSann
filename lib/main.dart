import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysample/pages/login_screen.dart';
import 'package:mysample/pages/register_screen.dart';
import 'package:mysample/pages/profile_screen.dart';

import 'package:mysample/pages/home_screen.dart';
import 'package:mysample/pages/feeds_screen.dart';
import 'package:mysample/pages/mall_screen.dart';
import 'package:mysample/pages/splash_screen.dart';
import 'package:mysample/pages/transactions_screen.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const NavigationExample(),
      },
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    MallScreen(),
    TransactionsScreen(),
    // ProductGrid(),
    ProfileScreen(),
  ];

  // kondisi navbar muncul / tidak
  bool _showNavigationBar = true;

  // ===============================
  // DIALOG SELAMAT DATANG
  // ===============================

  @override
  void initState() {
    super.initState();

    // Menunggu sampai halaman selesai dibuat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  // Fungsi untuk menampilkan dialog
  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Column(
            children: [
              Icon(Icons.check_circle_outline, size: 50, color: Colors.green),

              SizedBox(height: 12),

              Text('Selamat Datang 👋', textAlign: TextAlign.center),
            ],
          ),

          content: const Text(
            'Halo Rapsann!\n\n'
            'Role: admin\n\n'
            'Selamat datang kembali di Tokoku.',
            textAlign: TextAlign.center,
          ),

          actionsAlignment: MainAxisAlignment.center,

          actions: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),

                child: const Text('Lanjut'),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===============================
  // HANDLE SCROLL
  // ===============================

  void _handleScroll(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      if (notification.direction == ScrollDirection.reverse) {
        setState(() {
          _showNavigationBar = false;
        });
      } else if (notification.direction == ScrollDirection.forward) {
        setState(() {
          _showNavigationBar = true;
        });
      }
    }
  }

  // ===============================
  // BUILD
  // ===============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _handleScroll(notification);
              return true;
            },

            child: pages[currentPageIndex],
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,

            left: 16,
            right: 16,

            bottom: _showNavigationBar ? 12 : -100,

            child: _navBar(),
          ),
        ],
      ),
    );
  }

  // ===============================
  // NAVBAR
  // ===============================

  Widget _navBar() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      elevation: 4,

      child: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },

        indicatorColor: const Color.fromARGB(255, 7, 255, 234),

        selectedIndex: currentPageIndex,

        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.store),
            icon: Icon(Icons.store_outlined),
            label: 'Mall',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.list_alt),
            icon: Badge(label: Text('2'), child: Icon(Icons.list_alt_outlined)),
            label: 'Transactions',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
