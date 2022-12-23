import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/controller/cart_controller.dart';
import 'package:medicine_order/ui/shipping_screen.dart';

import '../style/constant.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
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
        elevation: 0.0,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Get.defaultDialog(
                title: '',
                content: Obx(() => Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundColor: const Color(0xFFF2F2F7),
                            child: Image.asset(
                              'images/tag.png',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Apply promo code',
                            style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const <BoxShadow>[BoxShadow(color: kSubTitleColor, blurRadius: 10.0, offset: Offset(0.0, 0.75))],
                            ),
                            child: TextField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kDarkWhiteColor,
                                hintText: 'Enter promo code',
                                hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                border: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: kDarkWhiteColor)),
                            child: CheckboxListTile(
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                              isThreeLine: true,
                              title: Text(
                                'Discount on Diagnostics',
                                style: kTextStyle.copyWith(color: kButtonColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                              ),
                              subtitle: Text(
                                'Enjoy 25% discount on your next order! Upto ৳100, minimum order value ৳400)',
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10.0),
                                maxLines: 3,
                              ),
                              value: controller.discount.value,
                              onChanged: (bool? value) {
                                controller.discount(value);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(border: Border.all(color: kButtonColor), color: kButtonColor, borderRadius: BorderRadius.circular(4.0)),
                              child: Center(
                                child: Text(
                                  'Apply',
                                  style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'images/discount.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Apply promo code',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              color: kDividerColor,
              thickness: 4,
            ),
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
                            style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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
                      onTap: () => controller.cartItems.isNotEmpty? Get.to(ShippingScreen()) : Get.snackbar('No Item is in the cart', 'Please add some item in the cart to go to payment screen',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.white),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(border: Border.all(color: kButtonColor), color: kButtonColor, borderRadius: BorderRadius.circular(4.0)),
                        child: Center(
                          child: Text(
                            'Checkout',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ePharma',
                    style: kTextStyle.copyWith(color: Colors.black),
                  ),
                  Image.asset('images/companylogo.png'),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: kDividerColor,
                thickness: 4,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/pill.png',
                    height: 30.0,
                    width: 30.0,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'Medicines',
                    style: kTextStyle.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: kDividerColor,
                thickness: 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Type - Item',
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'QTY',
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Price(tk)',
                      textAlign: TextAlign.end,
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => controller.totalItems < 1 ? Text('No Items in the cart',style: kTextStyle.copyWith(color: Colors.black),):ListView.builder(
                itemCount: controller.cartItems.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_,i){
                  return Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          controller.cartItems[i].name ?? '',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(controller.cartItems[i].quantity.value == 1){
                                  controller.cartItems[i].isInCart(false);
                                  controller.cartItems[i].quantity(0);
                                  controller.cartItems.remove(controller.cartItems[i]);
                                } else{
                                  controller.cartItems[i].quantity(controller.cartItems[i].quantity.value - 1);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black), shape: BoxShape.circle),
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.black,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: Text(
                                controller.cartItems[i].quantity.value.toString(),
                                style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.cartItems[i].quantity(controller.cartItems[i].quantity.value + 1);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black), shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 14.0,
                                ),
                              ),
                            )
                          ],
                        ),),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '৳${controller.cartItems[i].salePrice}',
                          textAlign: TextAlign.end,
                          style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ],
                  );
                },
              ),),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: kDividerColor,
                thickness: 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Medicine Total',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  Text(
                    '৳${controller.totalPrice.toString()}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: kDividerColor,
                thickness: 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vendor Total',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  Text(
                    '৳${controller.totalPrice.toString()}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),),
              const SizedBox(
                height: 40.0,
              ),
              Obx(() => Row(
                children: [
                  Text(
                    'Order Summary - ${controller.totalItems} Items',
                    maxLines: 2,
                    style: kTextStyle.copyWith(color: Colors.black, fontSize: 16.0),
                  ),
                ],
              ),),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: kDividerColor,
                thickness: 4,
              ),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  Text(
                    '৳${controller.totalPrice.toString()}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promo',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  Text(
                    'Apply Now',
                    style: kTextStyle.copyWith(color: kMainColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  Text(
                    '৳45.00',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payable',
                    style: kTextStyle.copyWith(color: Colors.black),
                  ),
                  Text(
                    '৳${controller.totalPrice.toString()}',
                    style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
