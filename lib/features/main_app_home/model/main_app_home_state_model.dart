//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

class MainAppHomeStateModel {
  MainAppHomeStateModel({this.currentNavigationIndex = defaultNavigationIndex});

  final int currentNavigationIndex;
  static const int defaultNavigationIndex = 0;

  MainAppHomeStateModel copyWith({int? newCurrentNavigationIndex}) =>
      MainAppHomeStateModel(
        currentNavigationIndex:
            newCurrentNavigationIndex ?? currentNavigationIndex,
      );
}
