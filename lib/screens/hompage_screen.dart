import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/constants/colors.dart';
import 'package:house_rental_app/constants/literals.dart';
import 'package:house_rental_app/models/category_card_model.dart';
import 'package:house_rental_app/screens/product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Houses";
  List<String> categories = ['Houses', 'Offices', 'Apartments'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppColors().kTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(FluentIcons.caret_down_24_regular),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors().kTextColor.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 15,
                        )
                      ],
                      color: AppColors().kWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      FluentIcons.alert_32_regular,
                      size: 28,
                      color: AppColors().kTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    FluentIcons.location_48_regular,
                    size: 36,
                    color: AppColors().kTeal300,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Califonia, USA',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors().kPrimary,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: AppColors().kWhite,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors().kTextColor.withOpacity(0.1),
                          offset: const Offset(0, 0),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          label: Row(
                            children: [
                              Icon(
                                FluentIcons.search_28_filled,
                                size: 28,
                                color: AppColors().kGray200,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Search House',
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  color: AppColors().kGray200,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors().kPrimary,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors().kTextColor.withOpacity(0.1),
                            offset: const Offset(0, 0),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      //Fluent icons doesn't have the required icon so I used the normal menu icon from material icons

                      child: Icon(
                        Icons.menu,
                        size: 50,
                        color: AppColors().kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...categories.map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: buildCategoryButtom(
                          title: item,
                          onTap: () {
                            setState(() {
                              selectedCategory = item;
                            });
                          },
                          isSelected: item == selectedCategory,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Nearby places',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            (selectedCategory == 'Houses')
                ? showHouseCard()
                : (selectedCategory == 'Offices')
                    ? showOfficeCard()
                    : showApartmentcard(),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView showHouseCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...AppLiterals().houseImages.map(
                (house) => buildNearbyCard(
                  house,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(cardModel: house),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  SingleChildScrollView showOfficeCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...AppLiterals().officeImages.map(
                (office) => buildNearbyCard(
                  office,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(cardModel: office),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  SingleChildScrollView showApartmentcard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...AppLiterals().apartmentImages.map(
                (apartment) => buildNearbyCard(
                  apartment,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(cardModel: apartment),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  Widget buildCategoryButtom({
    required String title,
    required Function() onTap,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: isSelected ? AppColors().kPrimary : AppColors().kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: AppColors().kTextColor.withOpacity(0.1),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors().kWhite : AppColors().kPrimary,
              fontSize: 24,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNearbyCard(CardModel cardModel, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 350,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors().kTextColor.withOpacity(0.1),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(cardModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
