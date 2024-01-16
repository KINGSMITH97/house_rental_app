import 'package:house_rental_app/models/category_card_model.dart';

class AppLiterals {
  AppLiterals();

  List houseImages = [
    CardModel(imageUrl: 'assets/images/house1.jpg', tag: 'House'),
    CardModel(imageUrl: 'assets/images/house2.jpg', tag: 'House'),
  ];
  List officeImages = [
    CardModel(imageUrl: 'assets/images/office1.jpg', tag: 'Office'),
    CardModel(imageUrl: 'assets/images/office2.jpg', tag: 'Office'),
  ];
  List apartmentImages = [
    CardModel(imageUrl: 'assets/images/apartment1.jpg', tag: 'Apartment'),
    CardModel(imageUrl: 'assets/images/apartment2.jpg', tag: 'Apartment'),
  ];

  List randomImages = [
    'assets/images/random1.jpg',
    'assets/images/random2.jpg',
    'assets/images/random3.jpg',
    'assets/images/random4.jpg',
  ];
}
