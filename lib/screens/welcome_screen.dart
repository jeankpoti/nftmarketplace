import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text.styles.dart';
import '../main_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: AppColors.accentTwo,
          body: Stack(
        children: [
          Image.asset(
            'assets/images/monkey 3.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: AppTextStyles.title,
                ),
                Text(
                  'Hip-Hop Ape Community',
                  style: AppTextStyles.title,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10.h,
            left: 25.w,
            right: 25.w,
            child: Card(
              color: Colors.transparent,
              child: SizedBox(
                width: 250.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Mint And Become Owner',
                        style: AppTextStyles.subtitle,
                      ),
                      Text(
                        'Dive into the realm of NFT exploration and unleash your creativity',
                        style: AppTextStyles.bodyLg,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 200.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.accent,
                          ),
                          child: Text(
                            'Continue',
                            style: AppTextStyles.buttonText,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
