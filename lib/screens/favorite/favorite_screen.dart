import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws2/shared/components/components.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';

import '../../shared/components/constants.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = Constants.getWidth(context);
    return  BlocConsumer<NewsCubit,NewsStatus>
    (builder: (context, state) {
      var list = NewsCubit.get(context).favorites;
      return favoriteBuilder(list, context);
    }, listener: (context, state) {
      
      
    },);
  }
}