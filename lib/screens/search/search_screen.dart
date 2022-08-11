

import 'package:flutter/material.dart';
import 'package:nws2/shared/components/components.dart';
import 'package:nws2/shared/components/cubit/cubit.dart';
import 'package:nws2/shared/components/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';

class SearchScreen extends StatelessWidget {
var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double _height = Constants.getHeight(context);
    double _width = Constants.getWidth(context);


    
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (context,state){},
      builder: (context,state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(_height*0.02),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onValidate: onValidateSearch,
                  label:'Search',
                  prefix: Icons.search,
                  onChanged: (value) {
                    onChangedValue(value,context);
                  },


                ),
              ),
              Expanded(child: articleBuilder(list, context,isSearch: true)),
            ],
          ),
        );
      },

    );
  }
}
String? onValidateSearch(String? text) {
  if (text == null || text.isEmpty) {
    return 'Search can\'t be empty';
  }
  return null;
}
void onChangedValue(value,context) {
 NewsCubit.get(context).getSearch(value);
}