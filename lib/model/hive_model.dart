import 'package:hive/hive.dart';
part 'hive_model.g.dart';
@HiveType(typeId: 0)
class FavoriteNews extends HiveObject{
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String author;
  @HiveField(2)
  late String publishedAt;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late String url;
  @HiveField(5)
  late String urlToImage;
  @HiveField(6)
  late String content;
}