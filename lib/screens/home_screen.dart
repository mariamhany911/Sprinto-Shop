import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sprints_project/models/offers.dart';
import 'package:sprints_project/widgets/change_lang.dart';
import 'package:sprints_project/widgets/offer_card.dart';
import 'package:sprints_project/widgets/product_card.dart';
import 'package:sprints_project/models/products.dart';
import 'package:sprints_project/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('our_products')),
          actions: [
            ChangeLang(),
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.initRoute,
                  (route) => false,
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${tr('featured_products')}✨",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsGeometry.directional(
                  top: 10,
                  bottom: 10,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width * .75,
                  child: PageView(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Cameras.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            tr('cameras'),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Lenses.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 80,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                tr('lenses'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,

                        children: [
                          Image.asset(
                            'assets/images/Accessories.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            tr('accessories'),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    img: products[index].img,
                    title: products[index].title,
                    price: products[index].price,
                  );
                },
              ),
              Divider(),
              Text(
                "${tr('hot_offers')}🔥",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return OfferCard(
                    offerDescription: tr(offers[index].offerDescription),
                    offerImg: offers[index].offerImg,
                    offerTitle: tr(offers[index].offerTitle),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
