// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_content_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telopContentStateHash() => r'7a37959cf0e830d396c17f94e527714abf4aa611';

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

abstract class _$TelopContentState
    extends BuildlessAutoDisposeNotifier<TelopContentStateModel> {
  late final dynamic text;
  late final dynamic fontSize;
  late final dynamic fontFamily;
  late final dynamic speed;

  TelopContentStateModel build({
    dynamic text = TelopContentState.defaultInitialText,
    dynamic fontSize = TelopContentState.defaultFontSize,
    dynamic fontFamily = TelopContentState.defaultFontFamily,
    dynamic speed = TelopContentState.defaultSpeed,
  });
}

/// See also [TelopContentState].
@ProviderFor(TelopContentState)
const telopContentStateProvider = TelopContentStateFamily();

/// See also [TelopContentState].
class TelopContentStateFamily extends Family<TelopContentStateModel> {
  /// See also [TelopContentState].
  const TelopContentStateFamily();

  /// See also [TelopContentState].
  TelopContentStateProvider call({
    dynamic text = TelopContentState.defaultInitialText,
    dynamic fontSize = TelopContentState.defaultFontSize,
    dynamic fontFamily = TelopContentState.defaultFontFamily,
    dynamic speed = TelopContentState.defaultSpeed,
  }) {
    return TelopContentStateProvider(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  @override
  TelopContentStateProvider getProviderOverride(
    covariant TelopContentStateProvider provider,
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
  String? get name => r'telopContentStateProvider';
}

/// See also [TelopContentState].
class TelopContentStateProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TelopContentState,
          TelopContentStateModel
        > {
  /// See also [TelopContentState].
  TelopContentStateProvider({
    dynamic text = TelopContentState.defaultInitialText,
    dynamic fontSize = TelopContentState.defaultFontSize,
    dynamic fontFamily = TelopContentState.defaultFontFamily,
    dynamic speed = TelopContentState.defaultSpeed,
  }) : this._internal(
         () =>
             TelopContentState()
               ..text = text
               ..fontSize = fontSize
               ..fontFamily = fontFamily
               ..speed = speed,
         from: telopContentStateProvider,
         name: r'telopContentStateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$telopContentStateHash,
         dependencies: TelopContentStateFamily._dependencies,
         allTransitiveDependencies:
             TelopContentStateFamily._allTransitiveDependencies,
         text: text,
         fontSize: fontSize,
         fontFamily: fontFamily,
         speed: speed,
       );

  TelopContentStateProvider._internal(
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
  TelopContentStateModel runNotifierBuild(
    covariant TelopContentState notifier,
  ) {
    return notifier.build(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  @override
  Override overrideWith(TelopContentState Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelopContentStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<TelopContentState, TelopContentStateModel>
  createElement() {
    return _TelopContentStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelopContentStateProvider &&
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
mixin TelopContentStateRef
    on AutoDisposeNotifierProviderRef<TelopContentStateModel> {
  /// The parameter `text` of this provider.
  dynamic get text;

  /// The parameter `fontSize` of this provider.
  dynamic get fontSize;

  /// The parameter `fontFamily` of this provider.
  dynamic get fontFamily;

  /// The parameter `speed` of this provider.
  dynamic get speed;
}

class _TelopContentStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TelopContentState,
          TelopContentStateModel
        >
    with TelopContentStateRef {
  _TelopContentStateProviderElement(super.provider);

  @override
  dynamic get text => (origin as TelopContentStateProvider).text;
  @override
  dynamic get fontSize => (origin as TelopContentStateProvider).fontSize;
  @override
  dynamic get fontFamily => (origin as TelopContentStateProvider).fontFamily;
  @override
  dynamic get speed => (origin as TelopContentStateProvider).speed;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
