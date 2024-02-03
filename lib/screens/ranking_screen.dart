import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constants/app_colors.dart';
import 'package:nftmarketplace/constants/app_text.styles.dart';

import '../widgets/product_card.dart';
import 'trend_screen.dart';

class RankingScreen extends StatefulWidget {
  final String? imageUrl;
  const RankingScreen({super.key, this.imageUrl = ''});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const RangeMaintainingScrollPhysics(),
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 40.h),
                      child: Hero(
                        tag: widget.imageUrl ?? "",
                        child: Container(
                          width: 400.w,
                          height: 250.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(widget.imageUrl ??
                                  'assets/images/monkey 3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: AnimatedContainer(
                      width: 50.w,
                      height: 10.h,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: _selectedIndex == index
                            ? AppColors.accentTwo
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hip-Hop Ape',
                  style: AppTextStyles.title,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline_outlined,
                    color: AppColors.accentTwo,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppColors.accent,
                ),
                child: Text(
                  'Buy for 12.5 ETH',
                  style: AppTextStyles.bodyLg.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TabBar(
              controller: _controller,
              indicatorColor: AppColors.accent,
              dividerColor: const Color.fromARGB(255, 41, 45, 58),
              tabs: [
                Tab(
                  child: Text(
                    'Trend',
                    style: AppTextStyles.bodyLg,
                  ),
                ),
                Tab(
                  child: Text(
                    'Details',
                    style: AppTextStyles.bodyLg,
                  ),
                ),
                Tab(
                  child: Text(
                    'Offers',
                    style: AppTextStyles.bodyLg,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 400.h,
              child: TabBarView(
                controller: _controller,
                children: [
                  const TrendScreen(),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia',
                    style: AppTextStyles.body,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
