import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  late Future<List> fetchProducts;
  @override
  void initState() {
    fetchProducts = fetchData();
    // TODO: implement initState
    super.initState();
  }

  Future<List> fetchData() async {
    final url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final products = data as List;
        print(products);
        return products;
      } else {
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(SnackBar(content: Text('error occurred')));
        return [];
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(SnackBar(content: Text('error occurred')));
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final products = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Image.network(products['image'])),
                );
              },
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
