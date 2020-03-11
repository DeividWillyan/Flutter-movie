import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/controller/MovieController.dart';
import 'package:movie/utils/api.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieController _controller = GetIt.I<MovieController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Hero(
          tag: _controller.movie.title,
          child: ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    ApiUtils.URL_IMAGE + _controller.movie.backdropPath,
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 30),
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 70,
          child: Align(
            child: RaisedButton(
              padding: EdgeInsets.all(8.0),
              shape: CircleBorder(),
              elevation: 12,
              onPressed: () {},
              color: Colors.white,
              child: Icon(Icons.play_arrow, color: Colors.red, size: 60),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.1,
          left: 25,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Icon(Icons.add, size: 35, color: Colors.white),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.1,
          right: 25,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Icon(Icons.share, size: 27),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _controller.movie.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Adventure, Family, Fantasy"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.red),
                      Icon(Icons.star, color: Colors.red),
                      Icon(Icons.star, color: Colors.red),
                      Icon(Icons.star, color: Colors.red),
                      Icon(Icons.star, color: Colors.grey)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Year"),
                          Text("2020",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Country"),
                          Text("USA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Lenght"),
                          Text("112 min",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, left: 50, right: 50, bottom: 40),
                    child: Container(
                      height: 110,
                      child: SingleChildScrollView(
                        child: Text(
                          _controller.movie.overview,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
