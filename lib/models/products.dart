import 'package:flutter/material.dart';
import 'package:sprints_project/models/product.dart';

List<Product> products = [
  Product(
    img: Image.asset('lib/assets/Canon.jpg'),
    title: "Canon EOS R6 Mark II",
    price: 1999
  ),
  Product(
    img: Image.asset('lib/assets/Sony.jpg'),
    title: "Sony Alpha 7 VI",
    price: 2499
    ),
  Product(
    img: Image.asset('lib/assets/Canon Lens.jpg'),
    title: "Canon 50mm f/1.4",
    price: 1499
  ),
  Product(
    img: Image.asset('lib/assets/SD Card.webp'),
    title: "SanDisk Extreme PRO 128GB SD Card",
    price: 39
  ),
  Product(
   img: Image.asset('lib/assets/Nikon.jpg'),
   title: "Nikon Z6 III",
   price: 2499
   ),
  Product(
    img: Image.asset('lib/assets/Sigma Lens.jpg'),
    title: "Sigma 16mm f/1.4 \nDC DN",
    price: 414
  ),
  Product(
    img: Image.asset('lib/assets/FujiFilm.webp'),
    title: "Fujifilm X100 series",
    price: 1599
  ),
  Product(
    img: Image.asset('lib/assets/Sony Lens.png'),
    title: "Sony FE 24-70mm \nf/2.8 GM II",
    price: 2449
  ),
  Product(
    img: Image.asset('lib/assets/Camera Cleaning Kit.webp'),
    title: "Camera Cleaning Kit",
    price: 24
  ),
];
