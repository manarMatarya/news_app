import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.mode();
                },
                icon: const Icon(
                  Icons.brightness_6_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomVanIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_center), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_baseball), label: 'Sport'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
           
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
