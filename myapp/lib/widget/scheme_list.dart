// lib/widgets/scheme_list.dart
import 'package:flutter/material.dart';
import '../models/scheme.dart';
// import '../widgets/scheme_list.dart';

class SchemeList extends StatelessWidget {
  final List<Scheme> schemes;

  SchemeList({required this.schemes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schemes.length,
      itemBuilder: (context, index) {
        return ListTile(
  contentPadding: EdgeInsets.all(10.0),
  title: Text(
    schemes[index].title,
    style: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.orange, // Adjust the color as needed
        ),
  ),
  subtitle: Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Text(
      schemes[index].description,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: Colors.grey, // Adjust the color as needed
          ),
    ),
  ),
  onTap: () {
    // Handle scheme details or navigation to a scheme details page
  },
);

      },
    );
  }
}
