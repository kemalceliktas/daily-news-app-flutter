import 'package:flutter/material.dart';

import '../globalconst/app_style.dart';
import '../globalconst/global_const.dart';


class CategoriesSlider extends StatefulWidget {
  const CategoriesSlider({super.key});

  @override
  State<CategoriesSlider> createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  int current=0;
   final List<String> categories = [
      "general",
    "business",
    "sports",
    "entertainment",
    "health",
    "science",
    "technology",
    ];

    
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: PageSize.height15*2.5,
       
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  current = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(right: 10),
                height: PageSize.height15 * 2,
                decoration: BoxDecoration(
                  color: current == index ? Colors.black.withOpacity(0.7) : kWhite,
                  borderRadius: BorderRadius.circular(PageSize.height10),
                  border: current == index
                      ? null
                      : Border.all(
                          color: kLightGrey,
                          width: 1,
                        ),
                ),
                child: Row(
                  children: [
                   
                    Text(
                      categories[index],
                      style: kEncodeSansMedium.copyWith(
                        color: current == index ? kWhite : Colors.black.withOpacity(0.7),
                        fontSize: PageSize.font20 / 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}