import 'package:flutter/material.dart';
import 'package:sprints_project/models/offer.dart';

List<Offer> offers = [
  Offer(
    offerDescription: "30% OFF — Camera Bag + Memory Card + Cleaning Kit.",
    offerImg: Image.asset("lib/assets/Bundle2.jpg"),
    offerTitle: "Camera Accessories Bundle",
  ),
  Offer(
    offerDescription: "Spend \$200 or more and get FREE shipping!",
    offerImg: Image.asset("lib/assets/Free Shipping.jpg"),
    offerTitle: "Free Shipping",
  ),
  Offer(
    offerDescription: "Buy any camera over \$1,000 and get a camera bag for FREE.",
    offerImg: Image.asset("lib/assets/Bag.jpg"),
    offerTitle: "Free Camera Bag",
  ),
  Offer(
    offerDescription: "Buy a camera + lens together and get \$100 OFF.",
    offerImg: Image.asset("lib/assets/Camera & Lens.jpg"),
    offerTitle: "Special Bundle Deal",
  ),
  Offer(
    offerDescription: "Spend \$500 or more and get a FREE camera cleaning kit.",
    offerImg: Image.asset("lib/assets/Cleaning Kit.jpg"),
    offerTitle: "Free Cleaning Kit",
  ),
];
