part of 'quotes_bloc.dart';

@immutable
sealed class QuotesState {}

class QuotesInitialState extends QuotesState {}
class QuotesLoadingState extends QuotesState{}
class QuotesLoadedState extends QuotesState{
  DataModel resData;
  QuotesLoadedState({required this.resData});
}
class QuotesErrorState extends QuotesState{
  String error;
  QuotesErrorState({required this.error});
}
