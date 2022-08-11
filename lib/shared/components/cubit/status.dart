abstract class NewsStatus {}

class NewsInitialState extends NewsStatus {}

class NewsBottomNavState extends NewsStatus {}

class NewsGetLoadingState extends NewsStatus {}

class NewsGetSuccessState extends NewsStatus{}

class NewsGetErrorState extends NewsStatus{
  final String error;

  NewsGetErrorState(this.error);
}











class NewsGetSearchLoadingState extends NewsStatus {}

class NewsGetSearchSuccessState extends NewsStatus{}

class NewsGetSearchErrorState extends NewsStatus{
  final String error;

  NewsGetSearchErrorState(this.error);
}
