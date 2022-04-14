import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';

class ScinceScreen extends StatelessWidget {
  const ScinceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).science;
        return buildCondition(list);
      },
    );
  }
}
