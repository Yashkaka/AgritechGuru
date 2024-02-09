import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlantingMenu(),
    );
  }
}

class PlantingMenu extends StatefulWidget {
  @override
  _PlantingMenuState createState() => _PlantingMenuState();
}

class _PlantingMenuState extends State<PlantingMenu> {
  String selectedCategory = 'all'; // Initial category selection
  String searchQuery = '';

late List<Map<String, dynamic>> _tools = [];

  @override
  void initState() {
    super.initState();
    _fetchTools();
  }

  Future<void> _fetchTools() async {
    final url = Uri.parse('https://agriculture-a4bfa-default-rtdb.firebaseio.com/tools.json');
    final response = await http.get(url);
final extractedData = json.decode(response.body) as List<dynamic>;
final List<Map<String, dynamic>> loadedTools = [];
    extractedData.forEach((toolId) {
      loadedTools.add({
        'id': toolId,
        'name': toolId['name'],
        'price': toolId['price'],
        'location': toolId['location'],
        'image': toolId['image'],
        'category': toolId['category'],
      });
    });
    setState(() {
      _tools = loadedTools;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmers Market'),
      ),
      body: _tools.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _tools.length,
              itemBuilder: (context, index) {
                final tool = _tools[index];
                return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(
          tool['image'],
          width: 100,
          height: 500,
          fit: BoxFit.cover,
        ),
        title: Text(tool['name']),
        subtitle: Text('₹${tool['price']} per day - ${tool['location']}'),
        trailing: ElevatedButton(
          child: Text('Rent'),
          onPressed: () => {}, // Implement rental functionality
        ),
      ),
    );
              },
            ),
    );
  }

}
  




  // Widget build(BuildContext context) {
  //   return Card(
  //     margin: EdgeInsets.all(10),
  //     child: ListTile(
  //       leading: Image.asset(
  //         tool['image'],
  //         width: 100,
  //         height: 500,
  //         fit: BoxFit.cover,
  //       ),
  //       title: Text(tool['name']),
  //       subtitle: Text('₹${tool['price']} per day - ${tool['location']}'),
  //       trailing: ElevatedButton(
  //         child: Text('Rent'),
  //         onPressed: () => {}, // Implement rental functionality
  //       ),
  //     ),
  //   );
  // }


