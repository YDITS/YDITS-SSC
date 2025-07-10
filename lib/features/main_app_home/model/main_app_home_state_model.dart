//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// A data model representing the state of the main application's home screen.
class MainAppHomeStateModel {
  MainAppHomeStateModel({this.currentNavigationIndex = defaultNavigationIndex});

  /// The index of the currently selected navigation item.
  final int currentNavigationIndex;

  /// The default navigation index.
  static const int defaultNavigationIndex = 0;

  /// Creates a copy of this model with the given fields replaced with new values.
  MainAppHomeStateModel copyWith({int? newCurrentNavigationIndex}) =>
      MainAppHomeStateModel(
        currentNavigationIndex:
            newCurrentNavigationIndex ?? currentNavigationIndex,
      );
}
