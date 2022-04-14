import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'what you search about?';
                    }
                  },
                  onChanged: (val) {
                    NewsCubit.get(context).getSearch(val: val);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).hintColor, width: 0.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      'Search',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
              Expanded(child: buildCondition(list, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
