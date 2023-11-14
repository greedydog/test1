import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/models/test_model.dart';
import 'package:flutter_test_project/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  int currentIndex = 0;

  final DataServices data;
  late var places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  // bloc으로 관리 되는 페이지가 스탯을 지우면서 뒤로가기할 사항이 있을 때 사용하기 위해 만들어졌습니다.
  void goHome() {
    emit(LoadedState(places));
  }
}
