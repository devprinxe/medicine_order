import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/ui/payment_screen.dart';

import '../controller/cart_controller.dart';
import '../style/constant.dart';
import 'cart_screen.dart';

class ShippingScreen extends StatelessWidget {
  ShippingScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'My Cart',
          style: kTextStyle,
        ),
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => GestureDetector(
                  onTap: () => Get.to(CartScreen()),
                  child: Badge(
                    badgeContent: Text(controller.totalItems.toString()),
                    badgeColor: kBadgeColor,
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Shipping Information Form',
                    style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Name',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Email',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: 'Flat / House / Road ',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Address',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      hintText: 'Post Code',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Post',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Invoice Information',
                    style: kTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@example.com',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Email',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  const Divider(
                    color: kDividerColor,
                    thickness: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '+88016563526352',
                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                      prefixIcon: SizedBox(
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Mobile no',
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                            ),
                          )),
                      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.isAccepted.value,
                      onChanged: (val) {
                        controller.isAccepted(val);
                      }),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "I agree with ",
                    style: TextStyle(color: kSubTitleColor),
                    children: [
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(color: kButtonColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
                  () => Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Payable',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                          Text(
                            '৳${controller.totalPrice.toString()}',
                            style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () => controller.isAccepted.value ? Get.to(PaymentScreen()) : Get.snackbar('Please accept terms and conditions', 'You Have to accept terms and conditions before proceeding to payment',snackPosition: SnackPosition.BOTTOM),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(border: Border.all(color: kButtonColor), color: kButtonColor, borderRadius: BorderRadius.circular(4.0)),
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
