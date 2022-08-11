import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws2/screens/favorite/favorite_screen.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import '../../../screens/news/news_screen.dart';
import '../../network/remote/api_helper.dart';
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
          'q':'besiktas',
          'apiKey':'353ef2e0f1eb4544877e8dccc3487881',
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


  


  List<dynamic>search=[];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    ApiHelper.getData(
      url: 'v2/everything',
      query: {

        'q':'$value',

        'apiKey':'353ef2e0f1eb4544877e8dccc3487881',
      },
    ).then((value) {
      search= value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }
  


  

}

