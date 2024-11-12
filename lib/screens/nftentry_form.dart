import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nftrium_mobile/widgets/left_drawer.dart';

class NftEntryFormPage extends StatefulWidget {
  const NftEntryFormPage({super.key});

  @override
  State<NftEntryFormPage> createState() => _NftEntryFormPageState();
}

class _NftEntryFormPageState extends State<NftEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  void _showSnackbar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah NFT',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama NFT",
                    labelText: "Nama NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama NFT tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Amount Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah NFT",
                    labelText: "Jumlah NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value ?? "") ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Jumlah NFT tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah NFT harus berupa angka!";
                    }
                    if (int.parse(value) <= 0) {
                      return "Jumlah NFT harus lebih dari 0!";
                    }
                    return null;
                  },
                ),
              ),
              // Description Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi NFT",
                    labelText: "Deskripsi NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 3,
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi NFT tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Save Button
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('NFT Berhasil Tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama NFT: $_name'),
                                    Text('Jumlah NFT: $_amount'),
                                    Text('Deskripsi NFT: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _name = "";
                                      _amount = 0;
                                      _description = "";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _showSnackbar("NFT berhasil disimpan!");
                      } else {
                        _showSnackbar("Silakan perbaiki kesalahan di formulir.",
                            backgroundColor: Colors.red);
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
