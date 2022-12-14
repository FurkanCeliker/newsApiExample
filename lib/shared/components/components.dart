import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:nws2/screens/new_detail/new_detail_screen.dart';
import 'package:nws2/shared/components/constants.dart';
import 'package:flutter_share/flutter_share.dart';

Widget searchFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  required FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,

      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget divider() => Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Future<void> share(String newsSourceUrl) async {
    await FlutterShare.share(
      title: 'New Share',
      linkUrl: newsSourceUrl,
      chooserTitle: 'News Share',
    );
  }

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigate(context, NewDetailScreen(detail: article['content'],img: article['urlToImage'],title: article['title'],author: article['author'],date: article['publishedAt'],newsSourceUrl: article['url'],));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
           
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
             Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']??Constants.getStaticNewsDetailImage()}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );


Widget articleBuilder(list, context,{isSearch=false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: list.length,
      ),
      fallback: (context) =>isSearch? Container() : const Center(child: CircularProgressIndicator()),
    );
    
  
Widget favoriteBuilder(list, context,{isSearch=false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: list.length,
      ),
      fallback: (context) =>isSearch? Container() : const Center(child: Text('Your favorites are empty')),
    );

void navigate(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );
