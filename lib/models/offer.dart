import 'package:flutter/material.dart';

class Offer {
  final String offerTitle;
  final String offerDescription;
  final Widget offerImg;
  Offer({
    required this.offerDescription,
    required this.offerImg,
    required this.offerTitle,
  });
}
