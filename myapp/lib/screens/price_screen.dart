import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Using Font Awesome icons
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TomatoPrice {
  final String state;
  final double price;

  TomatoPrice({required this.state, required this.price});
}

class TomatoPriceScreen extends StatelessWidget {
  final List<TomatoPrice> tomatoPrices = [
    TomatoPrice(state: 'Andhra Pradesh', price: 4500),
    TomatoPrice(state: 'Karnataka', price: 4200),
    TomatoPrice(state: 'Maharashtra', price: 4900),
    TomatoPrice(state: 'Gujarat', price: 4200),
    TomatoPrice(state: 'Jammu & Kashmir', price: 5100),
    TomatoPrice(state: 'Goa', price: 4500),
    TomatoPrice(state: 'Kerala', price: 4890),
    TomatoPrice(state: 'Punjab', price: 4570),
    TomatoPrice(state: 'Telengana', price: 4905),
    // Add more states and prices as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tomato Prices in India'),
      ),
      body: ListView.builder(
        itemCount: tomatoPrices.length,
        itemBuilder: (context, index) {
          final tomatoPrice = tomatoPrices[index];
          return ListTile(
            leading: Icon(FontAwesomeIcons.lemon, size: 30, color: Colors.red,), // Tomato icon on the left
            title: Text(tomatoPrice.state),
            subtitle: Row(
              children: [
                Icon(FontAwesomeIcons.arrowUp, size: 10, color: Colors.blue,),

                Text('₹ ${tomatoPrice.price.toStringAsFixed(2)} /Q'),
                // Icon(Icons.arrow_upward), // Up arrow icon on the right


                Icon(FontAwesomeIcons.arrowTrendUp, size: 15, color: Colors.green,),
                // Icon(Icons.arrowTrendUp), // Graph icon on the right
              ],
              mainAxisAlignment: MainAxisAlignment.end, // Align icons to the end
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TomatoPriceScreen(),
  ));
}
