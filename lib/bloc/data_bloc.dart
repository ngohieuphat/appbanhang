import 'package:banhang/bloc/data_event.dart';
import 'package:banhang/bloc/data_state.dart';
import 'package:banhang/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  Repo repo = Get.put(Repo());
  var api = [].obs;
  DataBloc(this.repo) : super(DataInitialState()) {
    on<DataEvent>((event, emit) async {
      // su kien goi den 
      if (event is LoadDataEvent) {
        emit(DataLoadingState());
        var apiValue = (await Repo.getData())?.data!.products.results;
        if (apiValue == null) {
          emit(DataErrorState());
        } else {
          emit(DataLoadedState(api: api));
        }
      }
    });
  }
}