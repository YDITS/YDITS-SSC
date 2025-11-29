// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the telop settings.

@ProviderFor(TelopSettings)
const telopSettingsProvider = TelopSettingsProvider._();

/// A notifier for managing the telop settings.
final class TelopSettingsProvider
    extends $NotifierProvider<TelopSettings, TelopSettingsModel> {
  /// A notifier for managing the telop settings.
  const TelopSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'telopSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$telopSettingsHash();

  @$internal
  @override
  TelopSettings create() => TelopSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelopSettingsModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelopSettingsModel>(value),
    );
  }
}

String _$telopSettingsHash() => r'80fb4117cc2bdebc3980d3d7a0ba24771eedf157';

/// A notifier for managing the telop settings.

abstract class _$TelopSettings extends $Notifier<TelopSettingsModel> {
  TelopSettingsModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TelopSettingsModel, TelopSettingsModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TelopSettingsModel, TelopSettingsModel>,
              TelopSettingsModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
