import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/scince_screen.dart';
import 'package:news_app/screens/setting_screen.dart';
import 'package:news_app/screens/sport_screen.dart';
import 'package:news_app/shared/network/local/shared_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    const BusinessScreen(),
    SportScreen(),
    const ScinceScreen(),
  ];

  void changeBottomVanIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavIndex());
  }

  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  void getBusiness() {
    emit(GetBusinessLoading());

    if (business.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'b047e7badb514913994c1f4770c12aa5'
      }).then((value) {
        business = value.data['articles'];

        emit(GetBusinessSuccess());
      }).catchError((error) {
        emit(GetBusinessError());
      });
    } else {
      emit(GetBusinessSuccess());
    }
  }

  void getSport() {
    emit(GetSportLoading());

    if (sport.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': 'b047e7badb514913994c1f4770c12aa5'
      }).then((value) {
        sport = value.data['articles'];
        emit(GetSportSuccess());
      }).catchError((error) {
        emit(GetSportError());
      });
    } else {
      emit(GetSportSuccess());
    }
  }

  void getScience() {
    emit(GetScienseLoading());
    if (science.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'b047e7badb514913994c1f4770c12aa5'
      }).then((value) {
        science = value.data['articles'];
        emit(GetScienceSuccess());
      }).catchError((error) {
        emit(GetScienceError());
      });
    } else {
      emit(GetScienceSuccess());
    }
  }

  void getSearch({required String val}) {
    emit(GetSearchLoading());
    if (search.length == 0) {
      DioHelper.getData(path: 'v2/everything', query: {
        'q': '$val',
        'apiKey': 'b047e7badb514913994c1f4770c12aa5'
      }).then((value) {
        print('**********************');
        print(value.data['articles']);
        search = value.data['articles'];
        emit(GetSearchSuccess());
      }).catchError((error) {
        print('#####################');
        emit(GetSearchError());
      });
    } else {
      emit(GetSearchSuccess());
    }
  }

  bool isDark = false;
  void mode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      SharedHelper.putData(key: 'mode', value: isDark);
      emit(ChangeModeState());
    }
  }
}
