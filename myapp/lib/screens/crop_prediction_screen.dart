import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class CropPredictionScreen extends StatefulWidget {
  @override
  _CropPredictionScreenState createState() => _CropPredictionScreenState();
}

class _CropPredictionScreenState extends State<CropPredictionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController kController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController rainfallController = TextEditingController();
  String predictionResult = '';

  Future<void> predictCrop() async {
    // Prepare input data
    var inputData = {
      'N': double.parse(nController.text),
      'P': double.parse(pController.text),
      'K': double.parse(kController.text),
      'temperature': double.parse(temperatureController.text),
      'humidity': double.parse(humidityController.text),
      'ph': double.parse(phController.text),
      'rainfall': double.parse(rainfallController.text),
    };

    // Make prediction
    var result = await predict(inputData);

    setState(() {
      predictionResult = result;
    });
  }



Future<String> predict(Map<String, dynamic> inputData) async {
  try {
    // Convert input data to JSON string
    String jsonData = jsonEncode(inputData);
    print(jsonData);
    // Define headers with correct content type
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    
    // Make HTTP POST request
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/predict'),
      headers: headers,
      body: jsonData,
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
  // Parse the response JSON
  dynamic responseData = jsonDecode(response.body);
  print(responseData);
      String prediction = responseData['prediction'].toString();
return prediction;
  // Check if responseData is a List
  
} 
    else {
      // If the request was not successful, throw an exception with the error message
      throw Exception('Failed to load prediction: ${response.statusCode}');
    }
  } 
  
  
  catch (error) {
    // Catch any errors that occur during the request and print them
    print('Error: $error');
    // Return null to indicate failure
    return "null";
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Prediction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: nController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'N'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: pController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'P'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'K'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: temperatureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Temperature'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: humidityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Humidity'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                         return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'pH'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                        return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: rainfallController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Rainfall'),
                validator: (String? value) {
                   if (value?.isEmpty ?? true) {
                    return 'Please enter a value';
                  }
                  
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                        predictCrop();
                            }

                     },
                     child: Text('Predict'),
                ),

              SizedBox(height: 20),
              Text(
                'Prediction Result: $predictionResult',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CropPredictionScreen(),
  ));
}
