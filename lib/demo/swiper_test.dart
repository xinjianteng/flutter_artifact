import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


// 库地址：https://github.com/best-flutter/flutter_swiper/blob/master/README-ZH.md

// * 基本参数
//    参数  默认值     描述
//    scrollDirection     Axis.horizontal     滚动方向，设置为Axis.vertical如果需要垂直滚动
//    loop    true    无限轮播模式开关
//    index   0   初始的时候下标位置
//    autoplay    false   自动播放开关.
//    onIndexChanged  void onIndexChanged(int index)  当用户手动拖拽或者自动播放引起下标改变的时候调用
//    onTap   void onTap(int index)   当用户点击某个轮播的时候调用
//    duration    300.0   动画时间，单位是毫秒
//    pagination  null    设置 widget SwiperPagination() 展示默认分页指示器
//    control     null    设置 widget SwiperControl() 展示默认分页按钮
//
//    分页指示器
//    分页指示器继承自 SwiperPlugin,SwiperPlugin 为 Swiper 提供额外的界面.设置为new SwiperPagination() 展示默认分页.
//    参数  默认值     描述
//    alignment   Alignment.bottomCenter  如果要将分页指示器放到其他位置，那么可以修改这个参数
//    margin  const EdgeInsets.all(10.0)  分页指示器与容器边框的距离
//    builder     SwiperPagination.dots   目前已经定义了两个默认的分页指示器样式： SwiperPagination.dots 、 SwiperPagination.fraction，都可以做进一步的自定义.
//
//
//    控制按钮
//    控制按钮组件也是继承自 SwiperPlugin,设置 widget SwiperControl() 展示默认控制按钮.
//    参数  默认值     描述
//    iconPrevious    Icons.arrow_back_ios    上一页的IconData
//    iconNext    Icons.arrow_forward_ios     下一页的IconData
//    color   Theme.of(context).primaryColor  控制按钮颜色
//    size    30.0    控制按钮的大小
//    padding     const EdgeInsets.all(5.0)   控制按钮与容器的距离
//
//
//    控制器(SwiperController)
//    SwiperController 用于控制 Swiper的index属性, 停止和开始自动播放. 通过 widget SwiperController() 创建一个SwiperController实例，并保存，以便将来能使用。
//    方法  描述
//    void move(int index, {bool animation: true})    移动到指定下标，设置是否播放动画
//    void next({bool animation: true})   下一页
//    void previous({bool animation: true})   上一页
//    void startAutoplay()    开始自动播放
//    void stopAutoplay()     停止自动播放
//    自动播放
//    参数  默认值     描述
//    autoplayDely    3000    自动播放延迟毫秒数.
//    autoplayDisableOnInteraction    true    当用户拖拽的时候，是否停止自动播放.

class SwiperTest extends StatefulWidget {
  @override
  _SwiperTestState createState() {
    // TODO: implement createState
    return new _SwiperTestState();
  }
}

class _SwiperTestState extends State<SwiperTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播组件'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemCount: 3,
          itemBuilder: _swiperBuilder,
          pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            ),
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.bottomCenter,
          ),
          controller: new SwiperController(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          autoplayDelay: 3000,
          autoplayDisableOnInteraction: true,
          onTap: (index) => print('点击了第$index个'),
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://via.placeholder.com/350x150",
      fit: BoxFit.cover,
    ));
  }
}
