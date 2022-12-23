import 'package:get/get.dart';

class MedicineModel {
  int? id;
  String? name;
  String? companyName;
  String? regularPrice;
  String? salePrice;

  MedicineModel({
    required this.id,
    required this.name,
    required this.companyName,
    required this.regularPrice,
    required this.salePrice,
  });

  final quantity = 0.obs;
  final isInCart = false.obs;
}

List<MedicineModel> medicineList = [
  MedicineModel(
    id: 1,
    name: 'A-One XR 665 mg',
    companyName: 'Apex Pharma',
    regularPrice: '200.00',
    salePrice: '180.00',
  ),
  MedicineModel(
    id: 2,
    name: 'Ace 500 mg',
    companyName: 'Square Pharma',
    regularPrice: '600.00',
    salePrice: '550.00',
  ),
  MedicineModel(
    id: 3,
    name: 'Ace Power 1000 mg',
    companyName: 'Square Pharma',
    regularPrice: '400.00',
    salePrice: '380.00',
  ),
  MedicineModel(
    id: 4,
    name: 'Ace XR 665 mg',
    companyName: 'Square Pharma',
    regularPrice: '200.00',
    salePrice: '160.00',
  ),
  MedicineModel(
    id: 5,
    name: 'Acep 500 mg',
    companyName: 'Zenith Pharma',
    regularPrice: '120.00',
    salePrice: '80.00',
  ),
  MedicineModel(
    id: 6,
    name: 'Aceta 500 mg',
    companyName: 'Bio Pharma',
    regularPrice: '240.00',
    salePrice: '200.00',
  ),
  MedicineModel(
    id: 7,
    name: 'Aceta Extend 665 mg',
    companyName: 'Bio Pharma',
    regularPrice: '200.00',
    salePrice: '180.00',
  ),
  MedicineModel(
    id: 8,
    name: 'Aceto 500 mg',
    companyName: 'Reliance Pharma',
    regularPrice: '120.00',
    salePrice: '100.00',
  ),
  MedicineModel(
    id: 9,
    name: 'Act 665 mg',
    companyName: 'Ambee Pharma',
    regularPrice: '200.00',
    salePrice: '190.00',
  ),
  MedicineModel(
    id: 10,
    name: 'Asta XR 665 mg',
    companyName: 'Rephco Pharma',
    regularPrice: '200.00',
    salePrice: '180.00',
  ),
];
