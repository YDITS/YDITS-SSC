// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_app_home_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the state of the main application's home screen.

@ProviderFor(MainAppHomeState)
const mainAppHomeStateProvider = MainAppHomeStateProvider._();

/// A notifier for managing the state of the main application's home screen.
final class MainAppHomeStateProvider
    extends $NotifierProvider<MainAppHomeState, MainAppHomeStateModel> {
  /// A notifier for managing the state of the main application's home screen.
  const MainAppHomeStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainAppHomeStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainAppHomeStateHash();

  @$internal
  @override
  MainAppHomeState create() => MainAppHomeState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainAppHomeStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainAppHomeStateModel>(value),
    );
  }
}

String _$mainAppHomeStateHash() => r'ccb07590392b82b51dd5611ac01d124fa89b42e7';

/// A notifier for managing the state of the main application's home screen.

abstract class _$MainAppHomeState extends $Notifier<MainAppHomeStateModel> {
  MainAppHomeStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MainAppHomeStateModel, MainAppHomeStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainAppHomeStateModel, MainAppHomeStateModel>,
              MainAppHomeStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
