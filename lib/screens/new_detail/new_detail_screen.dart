import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws2/model/boxes.dart';
import 'package:nws2/model/hive_model.dart';
import 'package:nws2/screens/WebView/web_view_screen.dart';
import 'package:nws2/shared/components/components.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import '../../shared/components/constants.dart';
import 'package:flutter_share/flutter_share.dart';

class NewDetailScreen extends StatefulWidget {
  final String? title;
  final String? img;
  final String? detail;
  final String? date;
  final String? author;
  final String? newsSourceUrl;
  NewDetailScreen(
      {required this.title,
      required this.img,
      required this.detail,
      required this.date,
      required this.author,
      required this.newsSourceUrl});

  @override
  State<NewDetailScreen> createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = Constants.getHeight(context);
    double _width = Constants.getWidth(context);
    return BlocConsumer<NewsCubit, NewsStatus>(
      builder: (context, state) {
        return buildNewsDetailPage(_width, _height, context);
      },
      listener: (context, state) {},
    );
  }

  Scaffold buildNewsDetailPage(
      double _width, double _height, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                List<Map<String, dynamic>> favorites =
                    NewsCubit.get(context).favorites;
                Map<String, dynamic> item = {
                  'title': widget.title,
                  'author': widget.author,
                  'description': widget.detail,
                  'urlToImage': widget.img,
                  'publishedAt': widget.date,
                  'url': widget.newsSourceUrl
                };
                if (!favorites.contains(item)) {
                  favorites.add(item);
                } else {
                  favorites.remove(item);
                }
              },
              icon: Icon(
                Icons.favorite_outline,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                share(widget.newsSourceUrl.toString());
              },
              icon: Icon(Icons.share)),
        ],
        title: Text(Constants.getDetailPageAppTitle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.img ?? Constants.getStaticNewsDetailImage(),
              width: _width,
              height: _height * 0.4,
            ),
            SizedBox(
              height: _height * 0.05,
            ),
            Text(
              widget.title ?? '',
              style: Constants.getDetailPageTitleStyle(),
            ),
            SizedBox(
              height: _height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      Expanded(
                          child: Text(
                        widget.author ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  width: _width * 0.5,
                  height: _height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.date_range),
                        Text(widget.date ?? ''),
                      ]),
                  width: _width * 0.5,
                  height: _height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                ),
              ],
            ),
            SizedBox(
              height: _height * 0.05,
            ),
            Text(widget.detail ?? ''),
            SizedBox(
              height: _height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      navigate(
                          context, WebViewScreen(widget.newsSourceUrl ?? ''));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.web,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: _width * 0.02,
                        ),
                        Text(
                          Constants.getWebViewButtonText(),
                          style: Constants.getWebViewButtonTextStyle(),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _addFavorite(String title, String author, String description,
      String newsSourceUrl, String urlToImage, String publishedAt) {
    final favorites = FavoriteNews()
      ..author = author
      ..description = description = newsSourceUrl = newsSourceUrl
      ..publishedAt = publishedAt
      ..urlToImage = urlToImage
      ..content = 'asd';
    final box = Boxes.getFavorites();
    box.add(favorites);
   return box.add(favorites);
   
  }
}
