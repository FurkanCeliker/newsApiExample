import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nws2/shared/block_observer.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import 'package:nws2/shared/network/remote/api_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/News_App/news_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  ApiHelper.init();
  BlocOverrides.runZoned(
        () {runApp(MyApp());},
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewsCubit()
      ..getNews(),
      

      child: BlocConsumer<NewsCubit, NewsStatus>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'News',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.grey,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white.withOpacity(0.0),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  actionsIconTheme:const IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle:const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black45,
                backgroundColor: Colors.white54,
                elevation: 20.0,
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.grey,
              scaffoldBackgroundColor: Colors.white10,
              appBarTheme:const AppBarTheme(
                  titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black12,
                  ),
                  backgroundColor: Colors.black26,
                  elevation: 0.0,
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.black26,
                elevation: 20.0,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
            themeMode:  ThemeMode.light,
            home: NewsView(),
          );
        },
      ),
    );
  }
}
