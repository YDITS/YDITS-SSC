//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/features/main_app_home/model/main_app_home_state_model.dart';

part 'main_app_home_state_notifier.g.dart';

@riverpod
class MainAppHomeState extends _$MainAppHomeState {
  @override
  MainAppHomeStateModel build() {
    return MainAppHomeStateModel();
  }

  void setCurrentNavigationIndex(int newIndex) {
    state = state.copyWith(newCurrentNavigationIndex: newIndex);
  }
}
