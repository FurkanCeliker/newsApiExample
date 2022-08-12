import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws2/model/boxes.dart';
import 'package:nws2/model/hive_model.dart';
import 'package:nws2/screens/favorite/favorite_screen.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import '../../../screens/news/news_screen.dart';
import '../../core/api_helper.dart';
class NewsCubit extends Cubit<NewsStatus> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

int currentIndex=0;
  List<BottomNavigationBarItem> bottomItem=[
    const BottomNavigationBarItem(
        icon: Icon(
      Icons.newspaper,
      ),
  label: 'News',
        ),
  
  
  
   const BottomNavigationBarItem(
     icon: Icon(
       Icons.favorite,
     ),
     label: 'Favorite',
   ),
  ];

  List <Widget>screen=[
    NewsScreen(),
    FavoriteScreen()
    
  ];

  void changeBottomNavBar(int index){

    currentIndex=index;
if(index==0)getNews();
   


    emit(NewsBottomNavState());
  }

  List<dynamic>news=[];

  void getNews()
  {

    emit(NewsGetLoadingState());
    if(news.length==0){
      ApiHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'fenerbahçe',
          'apiKey':'e2b99e3173194a93b24d2aa638fc15c0',
        },
      ).then((value) {
        news= value.data['articles'];
        emit(NewsGetSuccessState());
      }).catchError((error){
        emit(NewsGetErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetSuccessState());
    }

  }


  List<FavoriteNews> favoriteNews=[];

  Future addFavorite(String title,String author,String url,String urlToImage,String description,String content,String publishedAt) async{
    final favorite= FavoriteNews()..author=author..content=content..description=description..publishedAt=publishedAt..title=title..url=url..urlToImage=urlToImage;
    final box = Boxes.getFavorites();
  }


  List<dynamic>search=[];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    ApiHelper.getData(
      url: 'v2/everything',
      query: {

        'q':'$value',

        'apiKey':'e2b99e3173194a93b24d2aa638fc15c0',
      },
    ).then((value) {
      search= value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }
  
bool isFavorite=false;
List<Map<String,dynamic>> favorites=[];
void getFavorites(){

}
  

}

