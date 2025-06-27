// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_content_weather_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telopContentWeatherStateHash() =>
    r'9f5d7e2b86e0314861d7f7a4b5a8ad2eb16d7bef';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TelopContentWeatherState
    extends BuildlessAutoDisposeNotifier<TelopContentWeatherStateModel> {
  late final dynamic text;
  late final dynamic fontSize;
  late final dynamic fontFamily;
  late final dynamic speed;

  TelopContentWeatherStateModel build({
    dynamic text = TelopContentWeatherState.defaultInitialText,
    dynamic fontSize = TelopContentWeatherState.defaultFontSize,
    dynamic fontFamily = TelopContentWeatherState.defaultFontFamily,
    dynamic speed = TelopContentWeatherState.defaultSpeed,
  });
}

/// See also [TelopContentWeatherState].
@ProviderFor(TelopContentWeatherState)
const telopContentWeatherStateProvider = TelopContentWeatherStateFamily();

/// See also [TelopContentWeatherState].
class TelopContentWeatherStateFamily
    extends Family<TelopContentWeatherStateModel> {
  /// See also [TelopContentWeatherState].
  const TelopContentWeatherStateFamily();

  /// See also [TelopContentWeatherState].
  TelopContentWeatherStateProvider call({
    dynamic text = TelopContentWeatherState.defaultInitialText,
    dynamic fontSize = TelopContentWeatherState.defaultFontSize,
    dynamic fontFamily = TelopContentWeatherState.defaultFontFamily,
    dynamic speed = TelopContentWeatherState.defaultSpeed,
  }) {
    return TelopContentWeatherStateProvider(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  @override
  TelopContentWeatherStateProvider getProviderOverride(
    covariant TelopContentWeatherStateProvider provider,
  ) {
    return call(
      text: provider.text,
      fontSize: provider.fontSize,
      fontFamily: provider.fontFamily,
      speed: provider.speed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'telopContentWeatherStateProvider';
}

/// See also [TelopContentWeatherState].
class TelopContentWeatherStateProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TelopContentWeatherState,
          TelopContentWeatherStateModel
        > {
  /// See also [TelopContentWeatherState].
  TelopContentWeatherStateProvider({
    dynamic text = TelopContentWeatherState.defaultInitialText,
    dynamic fontSize = TelopContentWeatherState.defaultFontSize,
    dynamic fontFamily = TelopContentWeatherState.defaultFontFamily,
    dynamic speed = TelopContentWeatherState.defaultSpeed,
  }) : this._internal(
         () =>
             TelopContentWeatherState()
               ..text = text
               ..fontSize = fontSize
               ..fontFamily = fontFamily
               ..speed = speed,
         from: telopContentWeatherStateProvider,
         name: r'telopContentWeatherStateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$telopContentWeatherStateHash,
         dependencies: TelopContentWeatherStateFamily._dependencies,
         allTransitiveDependencies:
             TelopContentWeatherStateFamily._allTransitiveDependencies,
         text: text,
         fontSize: fontSize,
         fontFamily: fontFamily,
         speed: speed,
       );

  TelopContentWeatherStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.speed,
  }) : super.internal();

  final dynamic text;
  final dynamic fontSize;
  final dynamic fontFamily;
  final dynamic speed;

  @override
  TelopContentWeatherStateModel runNotifierBuild(
    covariant TelopContentWeatherState notifier,
  ) {
    return notifier.build(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  @override
  Override overrideWith(TelopContentWeatherState Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelopContentWeatherStateProvider._internal(
        () =>
            create()
              ..text = text
              ..fontSize = fontSize
              ..fontFamily = fontFamily
              ..speed = speed,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
        fontSize: fontSize,
        fontFamily: fontFamily,
        speed: speed,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    TelopContentWeatherState,
    TelopContentWeatherStateModel
  >
  createElement() {
    return _TelopContentWeatherStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelopContentWeatherStateProvider &&
        other.text == text &&
        other.fontSize == fontSize &&
        other.fontFamily == fontFamily &&
        other.speed == speed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, fontSize.hashCode);
    hash = _SystemHash.combine(hash, fontFamily.hashCode);
    hash = _SystemHash.combine(hash, speed.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TelopContentWeatherStateRef
    on AutoDisposeNotifierProviderRef<TelopContentWeatherStateModel> {
  /// The parameter `text` of this provider.
  dynamic get text;

  /// The parameter `fontSize` of this provider.
  dynamic get fontSize;

  /// The parameter `fontFamily` of this provider.
  dynamic get fontFamily;

  /// The parameter `speed` of this provider.
  dynamic get speed;
}

class _TelopContentWeatherStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TelopContentWeatherState,
          TelopContentWeatherStateModel
        >
    with TelopContentWeatherStateRef {
  _TelopContentWeatherStateProviderElement(super.provider);

  @override
  dynamic get text => (origin as TelopContentWeatherStateProvider).text;
  @override
  dynamic get fontSize => (origin as TelopContentWeatherStateProvider).fontSize;
  @override
  dynamic get fontFamily =>
      (origin as TelopContentWeatherStateProvider).fontFamily;
  @override
  dynamic get speed => (origin as TelopContentWeatherStateProvider).speed;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
