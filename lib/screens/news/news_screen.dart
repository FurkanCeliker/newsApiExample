import 'package:flutter/material.dart';
import 'package:nws2/shared/components/components.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var list=NewsCubit.get(context).news;
        return  articleBuilder(list,context,_width);
      },

    );
  }
}
