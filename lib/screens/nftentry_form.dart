// // ignore_for_file: unused_import

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nftrium_mobile/widgets/left_drawer.dart';
// import 'package:http/http.dart' as http;
// import 'package:nftrium_mobile/models/nft_entry.dart'; // Ensure this path is correct
// import 'package:shared_preferences/shared_preferences.dart'; // For token storage

// class NftEntryFormPage extends StatefulWidget {
//   const NftEntryFormPage({super.key});

//   @override
//   State<NftEntryFormPage> createState() => _NftEntryFormPageState();
// }

// class _NftEntryFormPageState extends State<NftEntryFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = "";
//   double _price = 0.0;
//   String _description = "";
//   String _creator = "";
//   File? _imageFile;

//   final ImagePicker _picker = ImagePicker();

//   // Function to pick image from gallery
//   Future<void> _pickImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   // Function to show snackbar messages
//   void _showSnackbar(String message, {Color? backgroundColor}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.white),
//         ),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor:
//             backgroundColor ?? Theme.of(context).colorScheme.primary,
//       ),
//     );
//   }

//   // Function to submit form data to the API
//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) {
//       _showSnackbar("Silakan perbaiki kesalahan di formulir.",
//           backgroundColor: Colors.red);
//       return;
//     }

//     if (_imageFile == null) {
//       _showSnackbar("Silakan pilih gambar untuk NFT.",
//           backgroundColor: Colors.red);
//       return;
//     }

//     _formKey.currentState!.save();

//     try {
//       // Retrieve the auth token (assuming you store it using SharedPreferences)
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('auth_token');

//       if (token == null) {
//         _showSnackbar("User not authenticated.", backgroundColor: Colors.red);
//         return;
//       }

//       // Prepare the multipart request
//       var uri = Uri.parse('http://127.0.0.1:8000/create-nft-flutter');
//       var request = http.MultipartRequest('POST', uri);

//       // Add headers
//       request.headers['Authorization'] =
//           'Bearer $token'; // Adjust based on your auth method

//       // Add fields
//       request.fields['name'] = _name;
//       request.fields['price'] = _price.toString();
//       request.fields['description'] = _description;
//       request.fields['creator'] = _creator;

//       // Add image file
//       request.files
//           .add(await http.MultipartFile.fromPath('image', _imageFile!.path));

//       // Send the request
//       var response = await request.send();

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // Success
//         _showSnackbar("NFT berhasil disimpan!");
//         // Optionally, show a success dialog
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('NFT Berhasil Tersimpan'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Nama NFT: $_name'),
//                     Text('Harga NFT: $_price'),
//                     Text('Deskripsi NFT: $_description'),
//                     Text('Creator: $_creator'),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _formKey.currentState!.reset();
//                     setState(() {
//                       _name = "";
//                       _price = 0.0;
//                       _description = "";
//                       _creator = "";
//                       _imageFile = null;
//                     });
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         // Failure
//         String respStr = await response.stream.bytesToString();
//         _showSnackbar("Gagal menyimpan NFT: $respStr",
//             backgroundColor: Colors.red);
//       }
//     } catch (e) {
//       _showSnackbar("Terjadi kesalahan: $e", backgroundColor: Colors.red);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'Form Tambah NFT',
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.white,
//       ),
//       drawer: const LeftDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Name Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Nama NFT",
//                     labelText: "Nama NFT",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   onSaved: (String? value) {
//                     _name = value ?? "";
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Nama NFT tidak boleh kosong!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               // Price Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Harga NFT",
//                     labelText: "Harga NFT",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   onSaved: (String? value) {
//                     _price = double.tryParse(value ?? "") ?? 0.0;
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Harga NFT tidak boleh kosong!";
//                     }
//                     if (double.tryParse(value) == null) {
//                       return "Harga NFT harus berupa angka!";
//                     }
//                     if (double.parse(value) <= 0) {
//                       return "Harga NFT harus lebih dari 0!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               // Description Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Deskripsi NFT",
//                     labelText: "Deskripsi NFT",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   maxLines: 3,
//                   onSaved: (String? value) {
//                     _description = value ?? "";
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Deskripsi NFT tidak boleh kosong!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               // Creator Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Creator NFT",
//                     labelText: "Creator NFT",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   onSaved: (String? value) {
//                     _creator = value ?? "";
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Creator NFT tidak boleh kosong!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               // Image Picker
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: _pickImage,
//                       icon: const Icon(Icons.image),
//                       label: const Text("Pilih Gambar"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                     const SizedBox(width: 16.0),
//                     _imageFile != null
//                         ? Image.file(
//                             _imageFile!,
//                             width: 100,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           )
//                         : const Text("No image selected"),
//                   ],
//                 ),
//               ),
//               // Save Button
//               Align(
//                 alignment: Alignment.center,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Theme.of(context).colorScheme.primary,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40.0, vertical: 16.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       elevation: 5,
//                     ),
//                     onPressed: _submitForm,
//                     child: const Text(
//                       "Save",
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nftrium_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class NftEntryFormPage extends StatefulWidget {
  const NftEntryFormPage({super.key});

  @override
  State<NftEntryFormPage> createState() => _NftEntryFormPageState();
}

class _NftEntryFormPageState extends State<NftEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  double _price = 0.0;
  String _description = "";
  String _creator = "";
  String _imagePath = "";

  // Function to show snackbar messages
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

  // Function to submit form data to the API
  Future<void> _submitForm(CookieRequest request) async {
    if (!_formKey.currentState!.validate()) {
      _showSnackbar("Silakan perbaiki kesalahan di formulir.",
          backgroundColor: Colors.red);
      return;
    }

    _formKey.currentState!.save();

    try {
      // Prepare the JSON payload
      Map<String, dynamic> payload = {
        'name': _name,
        'price': _price,
        'description': _description,
        'creator': _creator,
        'image_path': _imagePath, // Send the image path
      };

      // Send POST request
      final response = await request.postJson(
        "http://127.0.0.1:8000/create-nft-flutter",
        jsonEncode(payload),
      );

      if (response['status'] == "success") {
        _showSnackbar("NFT berhasil disimpan!");
        // Optionally, show a success dialog
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
                    Text('Harga NFT: $_price'),
                    Text('Deskripsi NFT: $_description'),
                    Text('Creator: $_creator'),
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
                      _price = 0.0;
                      _description = "";
                      _creator = "";
                      _imagePath = "";
                    });
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Failure
        _showSnackbar("Gagal menyimpan NFT. Silakan coba lagi.",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      _showSnackbar("Terjadi kesalahan: $e", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
                  onSaved: (String? value) {
                    _name = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama NFT tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Price Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga NFT",
                    labelText: "Harga NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onSaved: (String? value) {
                    _price = double.tryParse(value ?? "") ?? 0.0;
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Harga NFT tidak boleh kosong!";
                    }
                    if (double.tryParse(value) == null) {
                      return "Harga NFT harus berupa angka!";
                    }
                    if (double.parse(value) <= 0) {
                      return "Harga NFT harus lebih dari 0!";
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
                  onSaved: (String? value) {
                    _description = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi NFT tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Creator Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Creator NFT",
                    labelText: "Creator NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onSaved: (String? value) {
                    _creator = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Creator NFT tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Image Path Field
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Path Gambar NFT",
                    labelText: "Path Gambar NFT",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onSaved: (String? value) {
                    _imagePath = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Path Gambar NFT tidak boleh kosong!";
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
                    onPressed: () => _submitForm(request),
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
