import 'package:flutter/material.dart';
import 'package:nftrium_mobile/screens/menu.dart';
import 'package:nftrium_mobile/screens/nftentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: const Column(
              children: [
                Text(
                  'NFTrium',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Buy your favorite NFTs here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.mood),
            title: const Text('Tambah NFT'),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NftEntryFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
