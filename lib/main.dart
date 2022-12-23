import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/cart_binding.dart';
import 'package:medicine_order/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CartBinding(),
      title: 'Medicine Order',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
