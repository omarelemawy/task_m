import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunment_ventures/core/consts/k_strings.dart';
import 'package:lunment_ventures/core/consts/navigation_service.dart';
import 'package:lunment_ventures/core/theme/app_colors.dart';
import 'package:lunment_ventures/core/widgets/custom_loading.dart';
import 'package:lunment_ventures/core/widgets/custom_text.dart';
import 'package:lunment_ventures/features/post/presentation/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/routes/route_strings.dart';
import '../../../../../core/widgets/loading_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeProvider homeProvider = context.read<HomeProvider>();

  @override
  void initState() {
    homeProvider.getPosts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText("Home"),
        backgroundColor: AppColors.mainApp,
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: Consumer<HomeProvider>(builder: (_, homeProvider, __) {
        return CustomLoading(
          isLoading: homeProvider.isLoading,
          loadingWidget: const LoadingWidget(),
          widget: homeProvider.postsList == null
              ? const SizedBox()
              : ListView.separated(
                  padding: EdgeInsets.all(20.r),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        NavigationService.context
                            .pushNamed(RouteStrings.postDetails, queryParams: {
                          Kstrings.postId:
                              homeProvider.postsList![index].id.toString()
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.r)),
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              homeProvider.postsList![index].title,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            20.verticalSpace,
                            CustomText(
                              homeProvider.postsList![index].body,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 20.verticalSpace;
                  },
                  itemCount: homeProvider.postsList!.length),
        );
      }),
    );
  }
}
