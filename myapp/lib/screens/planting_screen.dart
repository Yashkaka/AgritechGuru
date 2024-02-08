import 'package:flutter/material.dart';

class PlantingMenu extends StatefulWidget {
  @override
  _PlantingMenuState createState() => _PlantingMenuState();
}

class _PlantingMenuState extends State<PlantingMenu> {
  String selectedCategory = 'all'; // Initial category selection
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Farmers Market'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: _showSearch),
            // More app bar actions...
          ],
        ),
        body: Column(
          children: [
            // Top sorting options row
            _buildSortingOptionsRow(),

            // Search bar
            _buildSearchBar(),

            // List of tools
            _buildToolList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSortingOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton(
          value: selectedCategory,
          items: [
            DropdownMenuItem(value: 'all', child: Text('All categories')),
            DropdownMenuItem(value: 'tractor', child: Text('Tractors')),
            DropdownMenuItem(value: 'sowing_machine', child: Text('Sowing Machines')),
            DropdownMenuItem(value: 'pesticide', child: Text('Pesticides')),
            // More categories...
          ],
          onChanged: (value) {
            setState(() {
              selectedCategory = value.toString();
            });
          },
        ),
        // More sorting options...
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for tools...',
          border: OutlineInputBorder(),
        ),
        onChanged: (text) {
          setState(() {
            searchQuery = text;
          });
        },
      ),
    );
  }

  Widget _buildToolList() {
    final filteredTools = _filterTools();
    return Expanded(
      child: ListView.builder(
        itemCount: filteredTools.length,
        itemBuilder: (context, index) => _buildToolItem(filteredTools[index]),
      ),
    );
  }

  List<Map<String, dynamic>> _filterTools() {
    final tools = [
      {'name': 'Tractor - Mahindra 575', 'price': 2300, 'location': 'Mumbai', 'image': '../assets/tractor.jpeg', 'category': 'tractor'},
      {'name': 'Pesticide Sprayer - PowerMax PX50', 'price': 1300, 'location': 'Nashik', 'image': '../assets/pesticid.jpeg', 'category': 'pesticide'},
      // Add more tools with different categories and locations
      {'name': 'Manually Operated 6-Row', 'price': 1590, 'location': 'Pune', 'image': '../assets/sprayer2.jpeg', 'category': 'sowing_machine'},
      {'name': 'Brass tank knapsack sprayers', 'price': 1100, 'location': 'Nashik', 'image': '../assets/pesticide2.jpeg', 'category': 'pesticide'},
       {'name': 'Tractor Trolley', 'price': 8000, 'location': 'Hyderabad', 'image': '../assets/tractor2.jpeg', 'category': 'tractor'},
      {'name': 'Multi-crop Planter', 'price': 1650, 'location': 'Pune', 'image': '../assets/sowing_machine.jpeg', 'category': 'sowing_machine'},
      {'name': 'knapsack power sprayer', 'price': 1900, 'location': 'Nashik', 'image': '../assets/pesticid.jpeg', 'category': 'pesticide'},
      {'name': 'Hand‑held‑sprayers 	', 'price': 1080, 'location': 'Nashik', 'image': '../assets/pesticide2.jpeg', 'category': 'pesticide'},
       {'name': 'Hydraulic Tractor', 'price': 2000, 'location': 'Bihar', 'image': '../assets/tractor.jpeg', 'category': 'tractor'},
      {'name': 'Sowing Machine - John Deere DB50', 'price': 150, 'location': 'Pune', 'image': '../assets/sprayer2.jpeg', 'category': 'sowing_machine'},
       {'name': 'Mahindra Yuvraj ', 'price': 12900, 'location': 'Hyderabad', 'image': '../assets/tractor2.jpeg', 'category': 'tractor'},
      {'name': 'Pneumatic Planter', 'price': 1590, 'location': 'Pune', 'image': '../assets/sowing_machine.jpeg', 'category': 'sowing_machine'},

    ];
    return tools.where((tool) {
      final categoryMatch = selectedCategory == 'all' || tool['category'] == selectedCategory;
      final nameMatch = (tool['name'] as String).toLowerCase().contains(searchQuery.toLowerCase());
      return categoryMatch && nameMatch;
    }).toList();
  }

  Widget _buildToolItem(Map<String, dynamic> tool) {
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
  }

  void _showSearch() {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results UI
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions UI
    return Container();
  }
}
