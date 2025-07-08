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

/// A notifier for managing the state of the main application's home screen.
@riverpod
class MainAppHomeState extends _$MainAppHomeState {
  @override
  MainAppHomeStateModel build() {
    return MainAppHomeStateModel();
  }

  /// Sets the current navigation index to the given [newIndex].
  void setCurrentNavigationIndex(int newIndex) {
    state = state.copyWith(newCurrentNavigationIndex: newIndex);
  }
}
