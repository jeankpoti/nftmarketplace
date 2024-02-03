import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text.styles.dart';

class Productcard extends StatelessWidget {
  final ScrollController scrollController;
  const Productcard({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    List products = [
      {
        'image': 'assets/images/monkey 3.png',
      },
      {
        'image': 'assets/images/monkey.jpeg',
      },
      {
        'image': 'assets/images/monkey 2.jpg',
      },
      {
        'image': 'assets/images/monkey 4.jpg',
      },
      {
        'image': 'assets/images/monkey 5.jpg',
      },
      {
        'image': 'assets/images/monkey 7.jpg',
      },
      {
        'image': 'assets/images/monkey 8.jpg',
      },
      {
        'image': 'assets/images/monkey 6.jpg',
      },
    ];

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Container(
                width: 200.w,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(products[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5.h,
                      left: 10.w,
                      child: Card(
                        color: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: SizedBox(
                          width: 150.w,
                          height: 60.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 5.h),
                                Text(
                                  'Hip-Hop',
                                  style: AppTextStyles.bodyLg,
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Buy Soma Nope',
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: AppColors.accent,
                                      size: 15.w,
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.h,
                      right: 10.w,
                      child: Card(
                        color: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.h,
                      left: 50.w,
                      right: 50.w,
                      child: Card(
                        color: Colors.white54,
                        child: SizedBox(
                          width: 260.w,
                          height: 100.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 5.h),
                                Text(
                                  'Current end',
                                  style: AppTextStyles.bodyLg,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '24h : 03m : 18s',
                                  style: AppTextStyles.body,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 90.w,
                                      height: 35.h,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white54,
                                        ),
                                        child: Text(
                                          'Bid',
                                          style: AppTextStyles.buttonText,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 110.w,
                                      height: 35.h,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.accent,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Buy 3.4',
                                              style: AppTextStyles.buttonText,
                                            ),
                                            Icon(
                                              Icons.adobe_rounded,
                                              size: 15.w,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
