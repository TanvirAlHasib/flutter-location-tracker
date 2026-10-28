import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(AppColor.backGroundColor),
      title: Text("Real-Time Location Tracker", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Color(AppColor.headerTextColor),
      ),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}