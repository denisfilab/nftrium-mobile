import 'dart:convert';

import 'package:nftrium_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:nftrium_mobile/models/nft_entry.dart'; // Ensure this path is correct
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class NftEntryPage extends StatefulWidget {
  const NftEntryPage({super.key});

  @override
  State<NftEntryPage> createState() => _NftEntryPageState();
}

class _NftEntryPageState extends State<NftEntryPage> {
  Future<List<NftEntry>> fetchNftEntries(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/api/json/');

    // Decode response and convert to list of NftEntry objects
    List<NftEntry> nftEntries = NftEntryFromJson(json.encode(response));
    return nftEntries;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNftEntries(request),
        builder: (context, AsyncSnapshot<List<NftEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada data NFT.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final nftEntry = snapshot.data![index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nftEntry.fields.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Price: ${nftEntry.fields.price}'),
                      const SizedBox(height: 10),
                      Text('Description: ${nftEntry.fields.description}'),
                      const SizedBox(height: 10),
                      Text('Creator: ${nftEntry.fields.creator}'),
                      const SizedBox(height: 10),
                      Text('Token ID: ${nftEntry.fields.tokenId}'),
                      const SizedBox(height: 10),
                      Text('Created At: ${nftEntry.fields.createdAt}'),
                      const SizedBox(height: 10),
                      nftEntry.fields.image.isNotEmpty
                          ? Image.network(nftEntry.fields.image)
                          : const Text('No image available'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
