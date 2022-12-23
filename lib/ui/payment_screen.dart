import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/ui/order_success_screen.dart';

import '../controller/cart_controller.dart';
import '../style/constant.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Payment',
          style: kTextStyle,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You are buying from:',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Diagnostics',
                  style: kTextStyle.copyWith(color: Colors.black, fontSize: 24.0),
                ),
                Obx(() => Text(
                  '৳${controller.totalPrice}',
                  style: kTextStyle.copyWith(color: kMainColor, fontSize: 48.0, fontWeight: FontWeight.bold),
                )),
                Text(
                  '(All inclusive)',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Pay via any of the below methods',
              style: kTextStyle.copyWith(color: kSubTitleColor),
            ),
          ),
          Obx(() => Container(
            color: controller.methodValue.value == 'bKash Payment' ? kRadioButtonBgColor: Colors.white,
            child: RadioListTile(
              activeColor: kRadioButtonColor,
                contentPadding: const EdgeInsets.only(left: 10.0),
                value: 'bKash Payment',
                groupValue: controller.methodValue.value,
                title: Row(
                  children: [
                    Image.asset('images/bkash.png',width: 30.0,height: 30.0,),
                    const SizedBox(width: 10.0,),
                    Text('bKash Payment',style: kTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w700),),
                  ],
                ),
                onChanged: (val) {
                  controller.methodValue(val.toString());
                }),
          )),
          Obx(() => Container(
            color: controller.methodValue.value == 'Credit/Debit Card' ? kRadioButtonBgColor: Colors.white,
            child: RadioListTile(

                activeColor: kRadioButtonColor,
                contentPadding: const EdgeInsets.only(left: 10.0),
                value: 'Credit/Debit Card',
                groupValue: controller.methodValue.value,
                title: Row(
                  children: [
                    Image.asset('images/cardd.png',width: 30.0,height: 30.0,),
                    SizedBox(width: 10.0,),
                    Text('Credit/Debit Card',style: kTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w700),),
                  ],
                ),
                onChanged: (val) {
                  controller.methodValue(val.toString());
                }),
          )),
          Obx(() => Container(
            color: controller.methodValue.value == 'Nagad Payment' ? kRadioButtonBgColor: Colors.white,
            child: RadioListTile(
                activeColor: kRadioButtonColor,
                contentPadding: const EdgeInsets.only(left: 10.0),
                value: 'Nagad Payment',
                groupValue: controller.methodValue.value,
                title: Row(
                  children: [
                    Image.asset('images/nagad.png',width: 30.0,height: 30.0,),
                    SizedBox(width: 10.0,),
                    Text('Nagad Payment',style: kTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w700),),
                  ],
                ),
                onChanged: (val) {
                  controller.methodValue(val.toString());
                }),
          )),
          GestureDetector(
            onTap: () {
              controller.deleteCart();
              Get.offAll(() => OrderSuccess());
            },
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(border: Border.all(color: kButtonColor), color: kButtonColor, borderRadius: BorderRadius.circular(4.0)),
              child: Center(
                child: Text(
                  'Pay Now',
                  style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
