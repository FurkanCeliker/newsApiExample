import 'package:flutter/material.dart';
import 'package:nws2/screens/WebView/web_view_screen.dart';
import 'package:nws2/shared/components/components.dart';
import '../../shared/components/constants.dart';

class NewDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double _height = Constants.getHeight(context);
    double _width = Constants.getWidth(context);
    return buildNewsDetailPage(_width, _height, context);
  }

  Scaffold buildNewsDetailPage(
      double _width, double _height, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.getDetailPageAppTitle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              img ?? Constants.getStaticNewsDetailImage(),
              width: _width,
              height: _height * 0.4,
            ),
            SizedBox(
              height: _height * 0.05,
            ),
            Text(
              title ?? '',
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
                        author ?? '',
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
                        Text(date ?? ''),
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
            Text(detail ?? ''),
            SizedBox(
              height: _height * 0.05,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TextButton(
                    onPressed: () {
                      navigate(context, WebViewScreen(newsSourceUrl ?? ''));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        SizedBox(width: _width*0.02,),
                        Text(
                          Constants.getShareButtonText(),
                          style: Constants.getWebViewButtonTextStyle(),
                        ),
                        
                      ],
                    )),

                TextButton(
                    onPressed: () {
                      navigate(context, WebViewScreen(newsSourceUrl ?? ''));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.web,
                          color: Colors.black,
                        ),
                        SizedBox(width: _width*0.02,),
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
}
