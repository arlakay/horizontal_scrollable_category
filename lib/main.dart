import 'package:flutter/material.dart';
import 'package:learnrxdart/bloc/movie_bloc.dart';
import 'package:learnrxdart/model/category_model.dart';
import 'package:learnrxdart/ui/banner_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MovieBloc bloc;

  Widget _buildBannerPromo() => BannerHome();

  @override
  void initState() {
    super.initState();
    bloc = MovieBloc();
    bloc.fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.outFetcherCategory,
        builder: (context, AsyncSnapshot<Category> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int idxOne) {
                if (snapshot.data.data[idxOne].section == 'products') {
                  return Container(
                    height: MediaQuery.of(context).size.width / 10 + 35,
                    color: Colors.white,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 8.0, left: 0, right: 20, top: 8.0),
                      itemCount: snapshot.data.data[idxOne].items.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int idxTwo) {
                        return FutureBuilder<dynamic>(
                          future: bloc.fetchCategoryImage(snapshot.data
                              .data[idxOne].items[idxTwo].productImage),
                          builder: (context, snapshotImg) {
                            if (snapshotImg.hasData &&
                                snapshotImg != null) {
                              return Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                height:
                                    MediaQuery.of(context).size.width / 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1.5,
                                        blurRadius: 2.5,
                                      )
                                    ]),
                                child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4 -
                                                10,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4 -
                                                10,
                                            padding: EdgeInsets.all(4.0),
                                            child: Image(
                                              image: snapshotImg.data,
                                              fit: BoxFit.cover,
                                              // height: 35,
                                            ),
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                snapshot
                                                    .data
                                                    .data[idxOne]
                                                    .items[idxTwo]
                                                    .productName
                                                    .replaceAll(
                                                        'Pembiayaan', ''),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body2
                                                    .copyWith(
                                                        fontFamily:
                                                            'NeoSans',
                                                        fontWeight:
                                                            FontWeight
                                                                .w400),
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ))
                                        ],
                                      ),
                                    )),
                              );
                            } else if (snapshotImg.hasError) {
                              return Text(snapshotImg.error.toString());
                            }
                            return Center(child: Text('Loading...'));
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
