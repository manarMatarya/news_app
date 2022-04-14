part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeBottomNavIndex extends NewsState {}

class GetBusinessLoading extends NewsState {}

class GetBusinessSuccess extends NewsState {}

class GetBusinessError extends NewsState {}

class GetSportLoading extends NewsState {}

class GetSportSuccess extends NewsState {}

class GetSportError extends NewsState {}

class GetScienseLoading extends NewsState {}

class GetScienceSuccess extends NewsState {}

class GetScienceError extends NewsState {}

class GetSearchLoading extends NewsState {}

class GetSearchSuccess extends NewsState {}

class GetSearchError extends NewsState {}

class ChangeModeState extends NewsState {}
