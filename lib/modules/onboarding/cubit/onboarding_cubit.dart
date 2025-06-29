import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0); // initial index = 0

  void nextPage(int totalPages) {
    if (state < totalPages - 1) {
      emit(state + 1);
    }
  }

  void setPage(int index) {
    emit(index);
  }

  bool isLastPage(int totalPages) => state == totalPages - 1;
}
