import 'dart:convert'; // Required for JSON decoding

import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Components/DestinationTile.dart';
import 'package:travel_destinatio_listing_app/Components/myDrawer.dart';
import 'package:travel_destinatio_listing_app/Components/mySliverAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:travel_destinatio_listing_app/Models/Destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: Text(
              'Travel Destination',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            child: Text('Hello'),
          ),
        ],
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return DestinationTile(
                        title: products[index].title,
                        description: products[index].description,
                        category: products[index].category.toString(),
                        price: products[index].price,
                        discountPercentage:
                            products[index].discountPercentage,
                        rating: products[index].rating,
                        stock: products[index].stock,
                        tags: products[index].tags,
                        brand: products[index].brand,
                        sku: products[index].sku,
                        weight: products[index].weight.toDouble(),
                        dimensions: products[index].dimensions.toString(),
                        warrantyInformation:
                            products[index].warrantyInformation,
                        shippingInformation:
                            products[index].shippingInformation,
                        availabilityStatus:
                            products[index].availabilityStatus.toString(),
                        reviews: products[index].reviews.map((review) => review.toString()).toList(),
                        returnPolicy: products[index].returnPolicy.toString(),
                        minimumOrderQuantity: products[index].minimumOrderQuantity,
                        meta: products[index].meta.toJson(),
                        images: products[index].images,
                        thumbnail: products[index].thumbnail,
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List<Product>> getData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data['products']) {
        products.add(Product.fromJson(index));
      }
      return products;
    } else {
      return products;
    }
  }
}
