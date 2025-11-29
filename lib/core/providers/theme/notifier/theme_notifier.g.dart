// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the theme mode in the application.

@ProviderFor(Theme)
const themeProvider = ThemeProvider._();

/// A notifier for managing the theme mode in the application.
final class ThemeProvider extends $NotifierProvider<Theme, ThemeModel> {
  /// A notifier for managing the theme mode in the application.
  const ThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @$internal
  @override
  Theme create() => Theme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeModel>(value),
    );
  }
}

String _$themeHash() => r'364d0121c6910e9948a1d7de45bb84916e76d7fb';

/// A notifier for managing the theme mode in the application.

abstract class _$Theme extends $Notifier<ThemeModel> {
  ThemeModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeModel, ThemeModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeModel, ThemeModel>,
              ThemeModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
