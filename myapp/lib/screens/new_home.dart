import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Using Font Awesome icons
import 'crop_prediction_screen.dart';
import 'home_screen.dart';
import 'price_screen.dart';
import 'planting_screen.dart';
class NewHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgriTech Guru'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CropPredictionScreen()),
                      );
                    },
                    child: Card(
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.leaf, size: 50, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Crop Planning', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlantingMenu()),
                      );
                    },
                    child: Card(
                      color: Colors.blueAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.eye, size: 50, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Crop Monitoring', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Card(
                      color: Colors.orangeAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.circleInfo, size: 50, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Schemes', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TomatoPriceScreen()),
                      );
                    },
                    child: Card(
                      color: Colors.purpleAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.seedling, size: 50, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Crop Practices', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mandi Price',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text('₹45/kg', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('₹50/kg', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      // ... more prices
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'See All >',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
