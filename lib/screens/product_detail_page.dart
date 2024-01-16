import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/constants/colors.dart';
import 'package:house_rental_app/constants/literals.dart';
import 'package:house_rental_app/models/category_card_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.cardModel});
  final CardModel cardModel;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String description =
      "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image(
              image: AssetImage(widget.cardModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
            child: Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.cardModel.tag,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                FluentIcons.star_24_filled,
                                color: Color.fromARGB(255, 247, 222, 2),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '(4.8)',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FluentIcons.location_48_regular,
                            size: 28,
                            color: AppColors().kGray200,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Califonia, USA',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors().kGray200,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "${widget.cardModel.tag} Details",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0,
                          color: AppColors().kGray200,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...AppLiterals().randomImages.map(
                                (image) => buildMoreImage(image),
                              ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors().kGray200,
                                  letterSpacing: 0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    '\$1200',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '/month',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                      color: AppColors().kGray200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 85,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors().kPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors().kWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 50,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors().kWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            right: 24,
            top: 50,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors().kWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMoreImage(String imageUrl) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors().kTextColor.withOpacity(0.3),
            offset: const Offset(0, 0),
            blurRadius: 15,
          )
        ],
      ),
    );
  }
}
