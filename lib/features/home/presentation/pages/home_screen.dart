import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/util/app_navigator.dart';
import 'package:dubisign_task/core/widgets/error_widget.dart';
import 'package:dubisign_task/core/widgets/loading_widget.dart';
import 'package:dubisign_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:dubisign_task/features/home/presentation/widgets/alert_dialog.dart';
import 'package:dubisign_task/features/home/presentation/widgets/home_shimmer.dart';
import 'package:dubisign_task/features/home/presentation/widgets/search.dart';
import 'package:dubisign_task/features/home/presentation/widgets/stories_listview.dart';
import 'package:dubisign_task/features/home/presentation/widgets/users_listview.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    context.read<HomeCubit>().fGetAllUsers(isFirst: true);
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        context.read<HomeCubit>().fGetAllUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child:  BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetAllUsersLoading) {
              return const HomeShimmer();
            }
            else if (state is GetAllUsersError) {
              return AppErrorWidget(message: state.message,);
            }
            final usersList = context.watch<HomeCubit>().users;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: (context.watch<HomeCubit>().friends.length < 6) ? 6 : context.watch<HomeCubit>().friends.length,
                      itemBuilder: (context, index) {
                        return (index >= context.watch<HomeCubit>().friends.length)?
                        const StoriesListview() : StoriesListview(image: context.read<HomeCubit>().friends[index].image);
                      },
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Divider(color: grey2,thickness: 1.r,)
                  ),
                  Search(searchController: searchController),
                  Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsetsDirectional.only(top: 15.w),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: usersList.length,
                        itemBuilder: (context, index) {
                          return UsersListview(
                            image: usersList[index].image,
                            name:"${usersList[index].firstName} ${usersList[index].lastName}",
                            email: usersList[index].email,
                            isFriend: context.read<HomeCubit>().friends.contains(usersList[index]),
                            onTap: () {
                              if (context.read<HomeCubit>().friends.contains(usersList[index])) {
                                aleartDialog(() {
                                  context.read<HomeCubit>().addOrRemoveFriend(usersList[index]);
                                  sl<AppNavigator>().pop();
                                }, context);
                              }
                              else {
                                context.read<HomeCubit>().addOrRemoveFriend(usersList[index]);
                              }
                            }
                          );
                        },
                      ),
                      if(state is GetAllUsersPaginationLoading) const LoadingWidget()
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}