import 'package:artifact/res/colors.dart';
import 'package:artifact/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scoped_model/scoped_model.dart';

import '../home_page.dart';

//首页菜单控件
// ignore: must_be_immutable
class HomeMenu extends StatelessWidget {
  int homeMenuPosition;
  String title;
  IconData menuIcon;
  
  HomeMenu(this.homeMenuPosition, this.title,this.menuIcon);
  
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
        builder: (context, _, model) =>
            Container(
              height: ScreenUtil().setHeight(ADimens.menuHeight),
              child: Center(
                child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        menuIcon,
                        color: model.current == homeMenuPosition ? AColors.matching_1 : AColors.matching_2,
                        size: ScreenUtil().setHeight(ADimens.menuImgSize),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(ADimens.menuTextSize, allowFontScalingSelf: true),
                          color: model.current == homeMenuPosition ? AColors.matching_1 : AColors.matching_2,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    model.setCurrent(homeMenuPosition);
                  },
                ),
              ),
            ));
  }
}
