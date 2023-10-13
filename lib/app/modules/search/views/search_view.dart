import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 113, 173, 115),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "./lib/assets/gambar/jns.jpg",
              width: 400,
              height: 400,
            ),
            Center(
              child: Text(
                'Jangan lupa buang sampah pada tempatnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    "NonOrganik = Plastik",
    "Bahan Berbahaya = sampah medis",
    "Organik = Buah",
    "Organik = sisa makanan,",
    "NonOrganik = Kaca",
    "NonOrganik = Gelas",
    "Bahan Berbahaya = Elektronik",
    "Organik = Daun",
    "NonOrganik = Styrofoam",
    "NonOrganik = Kaleng",
    "Bahan Berbahaya = Baterai",
    "NonOrganik = Logam",
    "Bahan Berbahaya = Obat-obatan",
    "Organik = Kayu",
    "Bahan Berbahaya = Deterjen",
    "Bahan Berbahaya = Pemutih pakaian",
    "NonOrganik = Kertas",
    "Organik = Sayuran",
    "NonOrganik = Karet",
    "Bahan Berbahaya = Bahan kimia",
    "NonOrganik = Besi",
    "NonOrganik = botol",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    ;
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    ;
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
