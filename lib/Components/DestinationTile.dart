import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Components/ViewMorePage.dart';

class DestinationTile extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String sku;
  final double weight;
  final String dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<String> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Map<String, dynamic> meta;
  final List<String> images;
  final String thumbnail;


  const DestinationTile({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              thumbnail,
              height: 180,
              width: double.infinity,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewMorePage(
                          title: title,
                          description: description,
                          category: category,
                          price: price,
                          discountPercentage: discountPercentage,
                          rating: rating,
                          stock: stock,
                          tags: tags,
                          brand: brand,
                          sku: sku,
                          weight: weight,
                          dimensions: dimensions,
                          warrantyInformation: warrantyInformation,
                          shippingInformation: shippingInformation,
                          availabilityStatus: availabilityStatus,
                          reviews: reviews,
                          returnPolicy: returnPolicy,
                          minimumOrderQuantity: minimumOrderQuantity,
                          meta: meta,
                          images: images,
                          thumbnail: thumbnail,
                        )
                      ),
                    );
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
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
