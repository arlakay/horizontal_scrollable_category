import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:learnrxdart/model/banner_model.dart';
import 'package:learnrxdart/util/design_util.dart';

class BannerHome extends StatefulWidget {
  @override
  _BannerHomeState createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  var dummyList = new List<BannerModel>.generate(20, (i) {
    return BannerModel(
      category: 'hp',
      url: 'http://somewebsite.com/dummy_avatar.jpg',
    );
  });

  @override
  BuildContext get context => super.context;

  @override
  void initState() {
    super.initState();
    // _fetchBanner();
  }

  @override
  void dispose() {
    // bannerBloc.dispose();
    imageCache.clear();
    super.dispose();
  }

  // _fetchBanner() async {
  //   await bannerBloc.fetchBannerList("home").then((val) {
  //     setState(() {
  //       bannerBloc.bannerImages = bannerBloc.bannerImages;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    DesignUtil.formatFont(MediaQuery.of(context).size.height);

    return _buildBannerHome();
  }

// // Bug Fix UI Pada Banner Home sesuai pada Zeplin
//   Widget _buildCarousel() {
//     return Container(
//       color: Colors.white,
//       height: MediaQuery.of(context).size.width / 16 * 9,
//       alignment: Alignment.center,
//       child: customBannerCarousel.BannerCarousel(
//         images: dummyList,
//         boxFit: BoxFit.cover,
//         dotSize: 5.0,
//         dotSpacing: 15.0,
//         dotColor: Color.fromRGBO(250, 166, 26, 1),
//         indicatorBgPadding: 3.0,
//         dotBgColor: Colors.transparent,
//         autoplay: true,
//       ),
//     );
//   }

  Widget _buildBannerHome() => (new Stack(children: <Widget>[
        // _buildCarousel(),
        new Positioned(
          // headline
          child: InkWell(
            child: new Container(
              child: new Text("Lihat Semua Promo",
                  style: new TextStyle(
                      color: Colors.indigo,
                      fontSize: DesignUtil.fs12,
                      fontWeight: FontWeight.w600)),
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(183, 183, 183, 0.5) //Colors.grey[300]
                  ),
              alignment: Alignment.center,
              //padding: new EdgeInsets.fromLTRB(10.0, 2.5, 0.0, 16.0),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('banner_list');
            },
          ),
          bottom: 0,
          right: 0,
          height: 20,
          width: MediaQuery.of(context).size.width * 1 / 3.21 + 10,
        ),
      ]));
//Bug Fix Pada Banner Home sesuai pada Zeplin

  Widget buildBannerList() {
    return Container(
      height: 130,
      alignment: Alignment.center,
      child: Carousel(
        images: dummyList,
        boxFit: BoxFit.cover,
        dotSize: 5.0,
        dotSpacing: 15.0,
        dotColor: Colors.indigo,
        indicatorBgPadding: 3.0,
        dotBgColor: Colors.transparent,
        autoplay: true,
      ),
    );
  }
}
