import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunment_ventures/core/theme/app_colors.dart';
import 'package:lunment_ventures/core/widgets/custom_loading.dart';
import 'package:lunment_ventures/core/widgets/custom_text.dart';
import 'package:lunment_ventures/features/post/presentation/post_details/provider/post_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/loading_widget.dart';

class PostDetailsView extends StatefulWidget {
  const PostDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int? id;

  @override
  State<PostDetailsView> createState() => _PostDetailsViewState();
}

class _PostDetailsViewState extends State<PostDetailsView> {
  late final PostDetailsProvider homeProvider =
      context.read<PostDetailsProvider>();

  @override
  void initState() {
    homeProvider.initPage(widget.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText("Post Details"),
          backgroundColor: AppColors.mainApp,
          centerTitle: false,
          leading: InkWell(
            onTap: () {
              // Navigator.pop(context);
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          )),
      backgroundColor: Colors.white,
      body:
          Consumer<PostDetailsProvider>(builder: (_, postDetailsProvider, __) {
        return CustomLoading(
          isLoading: homeProvider.isLoading,
          loadingWidget: const LoadingWidget(),
          widget: SingleChildScrollView(
            child: Column(
              children: [
                homeProvider.postsDetails == null
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(20.r),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      homeProvider.postsDetails!.title,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        postDetailsProvider.deletePost();
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              20.verticalSpace,
                              CustomText(
                                homeProvider.postsDetails!.body,
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                homeProvider.commentList == null
                    ? const SizedBox()
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(20.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  homeProvider.commentList![index].name,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.blue),
                                ),
                                CustomText(
                                  homeProvider.commentList![index].email,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.blue),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  padding: EdgeInsets.all(20.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      20.verticalSpace,
                                      CustomText(
                                        homeProvider.postsDetails!.body,
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return 20.verticalSpace;
                        },
                        itemCount: homeProvider.commentList!.length)
              ],
            ),
          ),
        );
      }),
    );
  }
}
