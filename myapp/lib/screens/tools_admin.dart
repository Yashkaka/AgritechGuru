// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// // import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:farm_tool_app/farmer_screen.dart'; // Path to your farmer screen

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Farm Tool Management',
//       home: ToolsAdmin(), // Use FarmerScreen as the home route
//     );
//   }
// }

// class ToolsAdmin extends StatefulWidget {
//   @override
//   _FarmerScreenState createState() => _FarmerScreenState();
// }

// class _FarmerScreenState extends State<ToolsAdmin> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _category = '';
//   double _price = 0.0;
//   String _imageUrl = '';
//   String _location = '';

//   Future<String> uploadImage(File imageFile) async {
//     final String filename = "${DateTime.now().millisecondsSinceEpoch}.jpg";
//     final String refPath = 'tool_images/$filename';
//     final StorageReference ref = FirebaseStorage.instance.ref().child(refPath);
//     final UploadTask uploadTask = ref.putFile(imageFile);

//     try {
//       final TaskSnapshot result = await uploadTask;
//       final String downloadUrl = await result.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print('Error uploading image: $e');
//       return '';
//     }
//   }

//   Future<void> _addImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final PickedFile pickedFile = await _picker.getImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         // Upload image and update _imageUrl
//         final imageUrl = await uploadImage(pickedFile);
//         _imageUrl = imageUrl;
//       });
//     }
//   }

//   Future<void> _addTool() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       final ref = FirebaseFirestore.instance.collection('tools').doc();
//       await ref.set(Tool(
//         id: ref.id,
//         name: _name,
//         category: _category,
//         price: _price,
//         imageUrl: _imageUrl,
//         location: _location,
//       ).toMap());

//       // Show success message and clear form
//       setState(() {
//         _name = '';
//         _category = '';
//         _price = 0.0;
//         _imageUrl = '';
//         _location = '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Tools for Rent'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
//                 onSaved: (value) => _name = value!,
//               ),
//               DropdownButtonFormField<String>(
//                 value: _category,
//                 items: <DropdownMenuItem<String>>[
//                   DropdownMenuItem(value: 'Tractor', child: Text('Tractor')),
//                   DropdownMenuItem(value: 'Harvester', child: Text('Harvester')),
//                   // Add more categories as needed
//                 ],
//                 onChanged: (value) => setState(() => _category = value!)),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   final price = double.tryParse(value);
//                   if (price == null || price <= 0) {
//                     return 'Please enter a valid price';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _price = double.parse(value!),
//               ),
//               ElevatedButton(
//                 onPressed: _addImage,
//                 child: Text('Add Image'),
//               ),
//               if (_imageUrl.isNotEmpty) Image.network(_imageUrl),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Location'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a location' : null,
//                 onSaved: (value) => _location = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _addTool,
//                 child: Text('Add Tool'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Tool {
//   final String id;
//   final String name;
//   final String category;
//   final double price;
//   final String imageUrl;
//   final String location;

//   Tool({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.imageUrl,
//     required this.location,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'category': category,
//       'price': price,
//       'imageUrl': imageUrl,
//       'location': location,
//     };
//   }
// }
