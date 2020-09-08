import 'package:artifact/res/colors.dart';
import 'package:artifact/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';

import '../home_page.dart';

//首页菜单控件
// ignore: must_be_immutable
class HomeMenu extends StatelessWidget {
  int location;
  String title;
  IconData menuIcon;

  HomeMenu(this.location, this.title, this.menuIcon);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
      builder: (context, _, model) => Container(
        height: ScreenUtil().setHeight(Dimens.menuHeight),
        child: Center(
          child: GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(
                  menuIcon,
                  color: model.current == location
                      ? AColors.menu_select
                      : AColors.menu_normal,
                  size: ScreenUtil().setHeight(Dimens.menuImgSize),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(Dimens.menuTextSize,
                        allowFontScalingSelf: true),
                    color: model.current == location
                        ? AColors.menu_select
                        : AColors.menu_normal,
                  ),
                ),
              ],
            ),
            onTap: () {
              model.setCurrent(location);
            },
          ),
        ),
      ),
    );
  }
}
