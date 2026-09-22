import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sprints_project/models/offers.dart';
import 'package:sprints_project/widgets/offer_card.dart';
import 'package:sprints_project/widgets/product_card.dart';
import 'package:sprints_project/models/products.dart';
import 'package:sprints_project/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
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
            Text(tr('logout')),
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
            Text(context.locale==Locale('en', 'US')?"AR":"EN"),
            IconButton(
              onPressed: () {
                context.locale==Locale('en', 'US')?
                context.setLocale(Locale('arb', 'EG')):
                context.setLocale(Locale('en', 'US'))
                ;
              },
              icon: Icon(Icons.language),
            ),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8
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
              Text("${tr('hot_offers')}🔥",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return OfferCard(
                    offerDescription: offers[index].offerDescription,
                    offerImg: offers[index].offerImg,
                    offerTitle: offers[index].offerTitle,
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
