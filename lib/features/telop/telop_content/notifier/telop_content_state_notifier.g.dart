// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_content_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the state of the telop content.

@ProviderFor(TelopContentState)
const telopContentStateProvider = TelopContentStateProvider._();

/// A notifier for managing the state of the telop content.
final class TelopContentStateProvider
    extends $NotifierProvider<TelopContentState, TelopContentStateModel> {
  /// A notifier for managing the state of the telop content.
  const TelopContentStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'telopContentStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$telopContentStateHash();

  @$internal
  @override
  TelopContentState create() => TelopContentState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelopContentStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelopContentStateModel>(value),
    );
  }
}

String _$telopContentStateHash() => r'503d094c4c0abb03b1c6819c1e514d5ac0686493';

/// A notifier for managing the state of the telop content.

abstract class _$TelopContentState extends $Notifier<TelopContentStateModel> {
  TelopContentStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<TelopContentStateModel, TelopContentStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TelopContentStateModel, TelopContentStateModel>,
              TelopContentStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
