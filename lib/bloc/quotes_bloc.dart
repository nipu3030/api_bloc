import 'package:api_bloc/api_helper.dart';
import 'package:api_bloc/app_exception.dart';
import 'package:api_bloc/app_urls.dart';
import 'package:api_bloc/quotes_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quotes_event.dart';

part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc({required ApiHelper apiHelper}) : super(QuotesInitialState()) {
    on<GetQuotes>((event, emit) async {
      emit(QuotesLoadingState());
      try{
        var resJson = await apiHelper.getApi(url: AppUrls.URL_QUOTE);
        if (resJson != null) {
          var mData = DataModel.fromJson(resJson);
          emit(QuotesLoadedState(resData: mData));
        } else {
          emit(QuotesErrorState(error: 'ohh...,No....,Error Occurred'));
        }
      } catch (e){
        emit(QuotesErrorState(error: (e as AppException).toErrorMsg()));
      }
    });
  }
}
