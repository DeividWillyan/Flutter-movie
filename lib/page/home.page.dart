import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/controller/MovieController.dart';
import 'package:movie/page/detail.page.dart';
import 'package:movie/utils/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController _controller = GetIt.I<MovieController>();

  @override
  void initState() {
    super.initState();
    _controller.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return _controller.movies != null
          ? _body()
          : Center(child: CircularProgressIndicator());
    }));
  }

  _body() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Movies",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.search,
                size: 36,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Recommend",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "Recent",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "Popular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180, left: 25, right: 25),
          child: Container(
            height: 180,
            child: CarouselSlider(
              height: 170.0,
              aspectRatio: 2.0,
              viewportFraction: 0.8,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              items: [1, 2, 3, 4, 5].map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: CachedNetworkImageProvider(
                                ApiUtils.URL_IMAGE +
                                    _controller.movies.movies[i].posterPath),
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 380, left: 30, right: 25),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 405, left: 25, right: 25),
          child: Observer(
            builder: (_) {
              return _listView();
            },
          ),
        ),
      ],
    );
  }

  _listDestaque() {
    return Container(
      height: 180,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: CachedNetworkImageProvider(ApiUtils.URL_IMAGE +
                    _controller.movies.movies[index].posterPath),
              ),
            ),
          );
        },
      ),
    );
  }

  _listView() {
    return ListView.separated(
      itemCount: _controller.movies.movies.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _controller.setMovie(index);
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) => DetailPage()));
          },
          child: Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Hero(
                        tag: _controller.movies.movies[index].title,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  ApiUtils.URL_IMAGE +
                                      _controller
                                          .movies.movies[index].posterPath,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _controller.movies.movies[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star, size: 18, color: Colors.red),
                                Icon(Icons.star, size: 18, color: Colors.red),
                                Icon(Icons.star, size: 18, color: Colors.red),
                                Icon(Icons.star, size: 18, color: Colors.red),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Action, adventure",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white60),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "01h 30min",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 0);
      },
    );
  }
}
