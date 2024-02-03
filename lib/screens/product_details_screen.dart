import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/constants/app_colors.dart';

import '../constants/app_text.styles.dart';
import 'ranking_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? imageUrl;
  const ProductDetailsScreen({super.key, this.imageUrl = ''});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColors.primary,
                expandedHeight: 150.0,
                floating: true,
                pinned: true,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(bottom: 80.h),
                  child: FlexibleSpaceBar(
                    centerTitle: true,
                    expandedTitleScale: 1,
                    titlePadding: EdgeInsets.symmetric(horizontal: 16.w),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        Text(
                          'Marketplace',
                          style: AppTextStyles.title,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.segment_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  indicatorColor: AppColors.accent,
                  dividerColor: const Color.fromARGB(255, 41, 45, 58),
                  tabs: [
                    Tab(
                      child: Text(
                        'Ranking',
                        style: AppTextStyles.bodyLg,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Activity',
                        style: AppTextStyles.bodyLg,
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Ranking Screen
              RankingScreen(imageUrl: widget.imageUrl),
              // Activity Screen
              Center(
                child: Text(
                  'Activity',
                  style: AppTextStyles.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //  Padding(
    //   padding: EdgeInsets.only(top: 40.h),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       //   children: [
    //       //     IconButton(
    //       //       onPressed: () => Navigator.pop(context),
    //       //       icon: const Icon(
    //       //         Icons.arrow_back_ios,
    //       //       ),
    //       //     ),
    //       //     Text(
    //       //       'Marketplace',
    //       //       style: AppTextStyles.title,
    //       //     ),
    //       //     Padding(
    //       //       padding: EdgeInsets.only(right: 8.w),
    //       //       child: IconButton(
    //       //         onPressed: () {},
    //       //         icon: const Icon(
    //       //           Icons.segment_outlined,
    //       //         ),
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),
    //       SizedBox(height: 20.h),
    //       // TabBar(
    //       //   controller: _controller,
    //       //   indicatorColor: AppColors.accent,
    //       //   dividerColor: const Color.fromARGB(255, 41, 45, 58),
    //       //   tabs: [
    //       //     Tab(
    //       //       child: Text(
    //       //         'Ranking',
    //       //         style: AppTextStyles.bodyLg,
    //       //       ),
    //       //     ),
    //       //     Tab(
    //       //       child: Text(
    //       //         'Activity',
    //       //         style: AppTextStyles.bodyLg,
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),
    //       Container(
    //         color: AppColors.titleColor,
    //         width: double.infinity,
    //         height: 600.h,
    //         child: TabBarView(
    //           controller: _controller,
    //           children: [
    //             // Ranking Screen
    //             const RankingScreen(),
    //             // Activity Screen
    //             Center(
    //               child: Text(
    //                 'Activity',
    //                 style: AppTextStyles.bodyLg,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  }
}
