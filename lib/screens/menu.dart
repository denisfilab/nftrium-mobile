import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nftrium_mobile/screens/nftentry_form.dart';
import 'package:nftrium_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepPurple[700],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with Typography-Based Logo
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          'NFTrium',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      drawer: const LeftDrawer(),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.skateboarding_rounded,
                  size: 100,
                  color: Colors.deepPurpleAccent,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showSnackbar(
                          "Kamu telah menekan tombol Lihat Daftar NFT");
                    },
                    icon: const Icon(Icons.list_alt,
                        size: 24, color: Colors.white),
                    label: const Text(
                      'Lihat Daftar NFT',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Button 2: Add NFT
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NftEntryFormPage()),
                      );
                    },
                    icon: const Icon(Icons.add_box,
                        size: 24, color: Colors.white),
                    label: const Text('Tambah NFT'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Complementary color
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showSnackbar("Kamu telah menekan tombol Logout");
                    },
                    icon:
                        const Icon(Icons.logout, size: 24, color: Colors.white),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                Text(
                  'NFTrium',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.deepPurple[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
