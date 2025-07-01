import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(2);

  void setIndex(int index) => emit(index);

  void goBack() {
    if (state != 0) {
      setIndex(0);
    } else {
      SystemNavigator.pop();
    }
  }
}
