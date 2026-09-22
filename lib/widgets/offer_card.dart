import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offerTitle;
  final String offerDescription;
  final Widget offerImg;
  const OfferCard({
    super.key,
    required this.offerDescription,
    required this.offerImg,
    required this.offerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 10, 84, 145),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: 100, height: 100, child: offerImg),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  offerTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(offerDescription),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
