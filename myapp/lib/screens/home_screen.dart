// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/scheme.dart';
import '../widget/scheme_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSchemes = false;

  List<Scheme> governmentSchemes = [
    
    // Add more schemes
  Scheme(
    id: 1,
    title: 'Pradhan Mantri Kisan Samman Nidhi (PM-KISAN)',
    description:
        'Under PM-KISAN, an income support of Rs. 6,000 per year is provided to eligible farmer families. The amount is transferred directly to their bank accounts in three equal installments.',
    link: 'https://pmkisan.gov.in/',
  ),
  Scheme(
    id: 2,
    title: 'Kisan Credit Card (KCC)',
    description:
        'Kisan Credit Card is a credit scheme for farmers that provides them with timely and adequate credit to meet their farm and production expenses. It also serves as a financial inclusion tool for farmers.',
    link: 'https://www.pmkisan.gov.in/Public/KisanCreditCardpmkisan',
  ),
  Scheme(
    id: 3,
    title: 'Pradhan Mantri Fasal Bima Yojana (PMFBY)',
    description:
        'PMFBY is a crop insurance scheme that provides financial support to farmers in case of crop failure or damage due to natural calamities, pests, and diseases. It aims to ensure farmers against production risks.',
    link: 'https://pmfby.gov.in/',
  ),
  Scheme(
    id: 4,
    title: 'Rashtriya Krishi Vikas Yojana (RKVY)',
    description:
        'RKVY is an umbrella scheme for ensuring holistic development of agriculture and allied sectors by providing grants to States/Union Territories for various activities such as infrastructure development, research, and extension.',
    link: 'http://rkvy.nic.in/',
  ),
  Scheme(
    id: 5,
    title: 'National Mission on Sustainable Agriculture (NMSA)',
    description:
        'NMSA aims to make agriculture more productive, sustainable, remunerative, and climate-resilient. It covers initiatives related to water-use efficiency, soil health management, and climate-resilient agricultural practices.',
    link: 'http://nmsa.dac.gov.in/',
  ),
  Scheme(
    id: 6,
    title: 'Paramparagat Krishi Vikas Yojana (PKVY)',
    description:
        'PKVY promotes organic farming and supports farmers in adopting organic practices. It focuses on traditional and organic farming systems, thereby enhancing soil fertility and minimizing dependence on synthetic inputs.',
    link: 'https://pgsindia-ncof.gov.in/',
  ),
  Scheme(
    id: 7,
    title: 'MGNREGA for Agriculture',
    description:
        'Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA) is used for creating durable assets and providing employment to rural households. In agriculture, it can be utilized for water conservation, irrigation, and other related activities.',
    link: 'https://nrega.nic.in/netnrega/home.aspx',
  ),
  Scheme(
    id: 8,
    title: 'National Food Security Mission (NFSM)',
    description:
        'NFSM aims to increase the production of rice, wheat, pulses, coarse cereals, and commercial crops in a sustainable manner. It promotes holistic development of agriculture through area-specific strategies.',
    link: 'http://nfsm.gov.in/',
  ),
  Scheme(
    id: 9,
    title: 'PM Krishi Sinchai Yojana (PMKSY)',
    description:
        'PMKSY focuses on enhancing water-use efficiency through precision irrigation and efficient water management practices. It aims to improve on-farm water use to ensure "Per Drop More Crop".',
    link: 'https://pmksy.gov.in/',
  ),
  Scheme(
    id: 10,
    title: 'Agriculture Infrastructure Fund (AIF)',
    description:
        'AIF is aimed at providing financial support for the creation of post-harvest management infrastructure and community farming assets. It encourages farmers to invest in various projects that enhance the value of their produce.',
    link: 'https://aifp.mygov.in/',
  ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Government Schemes'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.shopping_cart),
        //     onPressed: () {
        //       setState(() {
        //         // Toggle the flag to show or hide the schemes
        //         showSchemes = true;
        //       });
        //     },
        //   ),
        // ],
      ),
      body: SchemeList(schemes: governmentSchemes),
    );
  }
}
