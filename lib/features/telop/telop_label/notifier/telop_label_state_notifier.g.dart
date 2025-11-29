// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_label_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the state of the telop label.

@ProviderFor(TelopLabelState)
const telopLabelStateProvider = TelopLabelStateProvider._();

/// A notifier for managing the state of the telop label.
final class TelopLabelStateProvider
    extends $NotifierProvider<TelopLabelState, TelopLabelStateModel> {
  /// A notifier for managing the state of the telop label.
  const TelopLabelStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'telopLabelStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$telopLabelStateHash();

  @$internal
  @override
  TelopLabelState create() => TelopLabelState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelopLabelStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelopLabelStateModel>(value),
    );
  }
}

String _$telopLabelStateHash() => r'af9b65e79ed16453ce621eeb79a015b9e90994e1';

/// A notifier for managing the state of the telop label.

abstract class _$TelopLabelState extends $Notifier<TelopLabelStateModel> {
  TelopLabelStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TelopLabelStateModel, TelopLabelStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TelopLabelStateModel, TelopLabelStateModel>,
              TelopLabelStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
