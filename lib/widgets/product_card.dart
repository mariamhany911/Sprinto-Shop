import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Widget img;
  final String title;
  final int price;
  const ProductCard({
    super.key,
    required this.img,
    required this.title,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _added = false;
  void showSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr('added_to_cart')),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Card(
            margin: EdgeInsets.all(10),
            color: const Color.fromARGB(84, 147, 147, 147),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 90, height: 90, child: widget.img),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("${widget.price}\$"),
                ElevatedButton(
                  onPressed: () {
                    showSnackBar(context);
                    setState(() {
                      _added = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _added=false;
                    });
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _added
                        ? WidgetStatePropertyAll(Colors.green)
                        : WidgetStatePropertyAll(
                            Color.fromARGB(255, 10, 84, 145),
                          ),
                  ),
                  child: _added
                      ? Text(tr('added'),style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),)
                      : Text(
                          tr('add'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 4,
          child: IconButton(
            onPressed: () {
              showSnackBar(context);
            setState(() {
                      _added = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _added=false;
                    });
                    });},
            icon:_added?Icon(Icons.check): Icon(Icons.add_shopping_cart),
          ),
        ),
      ],
    );
  }
}
