import 'package:flutter/material.dart';
import 'package:nws2/screens/Search/search_Screen.dart';
import 'package:nws2/shared/components/components.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';
class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
       
        return Scaffold(
          appBar: AppBar(
            title: Text(Constants.getAppTitle()),
            actions: [
              IconButton(
                onPressed: () {
                  navigate(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
