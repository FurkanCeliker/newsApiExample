import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static String getAppTitle() {
    final String getAppTitle = 'News';
    return getAppTitle;
  }
  
  static String getShareButtonText(){
  final String getShareButtonText='Share';
  return getShareButtonText;
  }

  static String getFavoriteAppTitle() {
    final String getAppTitle = 'Favorite';
    return getFavoriteAppTitle();
  }

  static double getHeight(BuildContext context) {
    final double getHeight = MediaQuery.of(context).size.height;
    
    return getHeight;
  }

  static TextStyle getDetailPageTitleStyle() {
    final TextStyle getDetailPageTitleStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20);
    return getDetailPageTitleStyle;
  }

  static String getWebViewButtonText(){
    final String getWebViewButtonText = 'New Source';
    return getWebViewButtonText;
  }
  static String getStaticNewsDetailImage(){
    final String getStaticNewsDetailImage='https://miro.medium.com/max/2400/1*qPxM5jMEt_hrSJbvJSelrQ.jpeg';
    return getStaticNewsDetailImage;
  }
  static String getDetailPageAppTitle(){
    final String getDetailPageAppTitle = 'New Detail Page';
    return getDetailPageAppTitle;
  }
  static TextStyle getWebViewButtonTextStyle(){
    final TextStyle getWebViewButtonTextStyle = TextStyle(color: Colors.black,fontSize: 18);
    return getWebViewButtonTextStyle;
  }

  static double getWidth(BuildContext context) {
    final double getWidth = MediaQuery.of(context).size.width;
    return getWidth;
  }
}
