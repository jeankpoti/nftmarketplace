import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constants/app_colors.dart';
import 'package:nftmarketplace/constants/app_text.styles.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const HomeScreen({super.key, required this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> categories = [
    'Recent',
    'Art',
    'Music',
    'Domain',
    'Collectibles',
    'Virtual World',
    'Metaverse',
    'Photography',
    'Sports',
    'Utility',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: AppColors.searchBar,
                  backgroundImage: const AssetImage(
                    'assets/images/avatar.png',
                  ),
                ),
                Text(
                  'NFT Marketplace',
                  style: AppTextStyles.title,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Stack(
                    // alignment: Alignment.topRight,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: AppColors.titleColor,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColors.accentTwo,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              '5',
                              style: AppTextStyles.body,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: AppColors.searchBar,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bored Apes...',
                      hintStyle: AppTextStyles.body,
                      prefixIcon: GestureDetector(
                        onTap: () => {},
                        child: const Icon(Icons.search),
                      ),
                      prefixIconColor: AppColors.titleColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: AppColors.primary,
                        ),
                      ),
                      // Enabled border
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.searchBar,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              height: 45.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        color: selectedIndex == index
                            ? AppColors.accentTwo
                            : AppColors.titleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: AppTextStyles.body,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                'Recent Collection',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.titleColor,
                ),
              ),
            ),
            //  Product card
            Productcard(scrollController: widget.scrollController),
          ],
        ),
      ),
    );
  }
}
