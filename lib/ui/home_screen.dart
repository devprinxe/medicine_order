import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/model/medicine_model.dart';
import 'package:medicine_order/ui/cart_screen.dart';
import 'package:medicine_order/ui/medicine_details.dart';

import '../controller/cart_controller.dart';
import '../style/constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Medicine',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45, blurRadius: 10.0, offset: Offset(0.0, 0.75))],
              ),
              height: 100.0,
              child: TextField(
                keyboardType: TextInputType.name,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kDarkWhiteColor,
                  hintText: 'What Are you searching for?',
                  hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kSubTitleColor,
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: kDarkWhiteColor)),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            ListView.builder(
              itemCount: medicineList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return ListTile(
                  onTap: () => Get.to(MedicineDetails(
                    medicine: medicineList[i],
                  )),
                  title: Text(
                    medicineList[i].name ?? '',
                    style: kTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  isThreeLine: true,
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medicineList[i].companyName ?? '',
                        style: kTextStyle.copyWith(
                          color: kSubTitleColor,
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '৳${medicineList[i].salePrice ?? ' '}',
                            style: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            '৳${medicineList[i].regularPrice ?? ' '}',
                            style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10.0, decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: GetX<CartController>(builder: (controller) {
                    return medicineList[i].isInCart.value
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if(medicineList[i].quantity.value == 1){
                                    medicineList[i].isInCart(false);
                                    medicineList[i].quantity(0);
                                    controller.cartItems.remove(medicineList[i]);
                                  } else{
                                    medicineList[i].quantity(medicineList[i].quantity.value - 1);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black), shape: BoxShape.circle),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 15.0),
                                    child: Icon(
                                      Icons.minimize,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                child: Text(
                                  medicineList[i].quantity.value.toString(),
                                  style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  medicineList[i].quantity(medicineList[i].quantity.value + 1);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black), shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.cartItems.add(medicineList[i]);
                                medicineList[i].quantity(1);
                                medicineList[i].isInCart(true);
                              },
                              child: Text(
                                'Add To Cart',
                                style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
