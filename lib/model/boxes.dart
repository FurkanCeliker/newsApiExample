import 'package:hive/hive.dart';
import 'package:nws2/model/hive_model.dart';
class Boxes{
  static Box<FavoriteNews> getFavorites()=>
  Hive.box('favorites');
}