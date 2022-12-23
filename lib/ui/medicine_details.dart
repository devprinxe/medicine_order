import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicine_order/controller/cart_controller.dart';
import 'package:medicine_order/model/medicine_model.dart';
import 'package:medicine_order/ui/cart_screen.dart';
import '../style/constant.dart';

class MedicineDetails extends StatelessWidget {
  MedicineDetails({Key? key, required this.medicine}) : super(key: key);

  final MedicineModel medicine;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Product',
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
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: Obx(() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    if(medicine.isInCart.isFalse){
                      controller.cartItems.add(medicine);
                      medicine.quantity(1);
                      medicine.isInCart(true);
                    } else{
                      Get.to(CartScreen());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor),
                        color: kButtonColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Center(child: Text(medicine.isInCart.value ? 'Go To Cart':'Add To Cart',style: kTextStyle.copyWith(color: kButtonColor,fontWeight: FontWeight.w600),),),
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(medicine.isInCart.isFalse){
                      controller.cartItems.add(medicine);
                      medicine.quantity(1);
                      medicine.isInCart(true);
                      Get.to(CartScreen());
                    } else{
                      Get.to(CartScreen());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor),
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Center(child: Text('Buy Now',style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.w600),),),

                  ),
                ),
              ),
            ],
          ),
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/med.png'),
              Row(
                children: [
                  Text(
                    '৳${medicine.salePrice ?? ' '}',
                    style: kTextStyle.copyWith(color: kMainColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    '৳${medicine.regularPrice ?? ' '}',
                    style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10.0, decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Text(
                medicine.name ?? '',
                style: kTextStyle.copyWith(color: Colors.black, fontSize: 20.0),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                medicine.companyName ?? '',
                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Short Description',
                style: kTextStyle.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Napa is indicated for fever, common cold and influenza, headache, toothache, earache, body pain, myalgia, neuralgia, dysmenorrhoea, sprains, colic pain, back pain, post-operative pain, postpartum pain, inflammatory pain, and post-vaccination pain in children. It is also indicated for rheumatic & osteoarthritic pain and stiffness of joints.',
                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13, overflow: TextOverflow.ellipsis, wordSpacing: 3.0),
                maxLines: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
