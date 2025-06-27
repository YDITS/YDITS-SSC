// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_content_eqinfo_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telopContentEqinfoStateHash() =>
    r'c24e16c3aa23d40709df399a0512784552b80b35';

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

abstract class _$TelopContentEqinfoState
    extends BuildlessAutoDisposeNotifier<TelopContentEqinfoStateModel> {
  late final dynamic text;
  late final dynamic fontSize;
  late final dynamic speed;

  TelopContentEqinfoStateModel build({
    dynamic text = TelopContentEqinfoState.defaultInitialText,
    dynamic fontSize = TelopContentEqinfoState.defaultFontSize,
    dynamic speed = TelopContentEqinfoState.defaultSpeed,
  });
}

/// See also [TelopContentEqinfoState].
@ProviderFor(TelopContentEqinfoState)
const telopContentEqinfoStateProvider = TelopContentEqinfoStateFamily();

/// See also [TelopContentEqinfoState].
class TelopContentEqinfoStateFamily
    extends Family<TelopContentEqinfoStateModel> {
  /// See also [TelopContentEqinfoState].
  const TelopContentEqinfoStateFamily();

  /// See also [TelopContentEqinfoState].
  TelopContentEqinfoStateProvider call({
    dynamic text = TelopContentEqinfoState.defaultInitialText,
    dynamic fontSize = TelopContentEqinfoState.defaultFontSize,
    dynamic speed = TelopContentEqinfoState.defaultSpeed,
  }) {
    return TelopContentEqinfoStateProvider(
      text: text,
      fontSize: fontSize,
      speed: speed,
    );
  }

  @override
  TelopContentEqinfoStateProvider getProviderOverride(
    covariant TelopContentEqinfoStateProvider provider,
  ) {
    return call(
      text: provider.text,
      fontSize: provider.fontSize,
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
  String? get name => r'telopContentEqinfoStateProvider';
}

/// See also [TelopContentEqinfoState].
class TelopContentEqinfoStateProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TelopContentEqinfoState,
          TelopContentEqinfoStateModel
        > {
  /// See also [TelopContentEqinfoState].
  TelopContentEqinfoStateProvider({
    dynamic text = TelopContentEqinfoState.defaultInitialText,
    dynamic fontSize = TelopContentEqinfoState.defaultFontSize,
    dynamic speed = TelopContentEqinfoState.defaultSpeed,
  }) : this._internal(
         () =>
             TelopContentEqinfoState()
               ..text = text
               ..fontSize = fontSize
               ..speed = speed,
         from: telopContentEqinfoStateProvider,
         name: r'telopContentEqinfoStateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$telopContentEqinfoStateHash,
         dependencies: TelopContentEqinfoStateFamily._dependencies,
         allTransitiveDependencies:
             TelopContentEqinfoStateFamily._allTransitiveDependencies,
         text: text,
         fontSize: fontSize,
         speed: speed,
       );

  TelopContentEqinfoStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
    required this.fontSize,
    required this.speed,
  }) : super.internal();

  final dynamic text;
  final dynamic fontSize;
  final dynamic speed;

  @override
  TelopContentEqinfoStateModel runNotifierBuild(
    covariant TelopContentEqinfoState notifier,
  ) {
    return notifier.build(text: text, fontSize: fontSize, speed: speed);
  }

  @override
  Override overrideWith(TelopContentEqinfoState Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelopContentEqinfoStateProvider._internal(
        () =>
            create()
              ..text = text
              ..fontSize = fontSize
              ..speed = speed,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
        fontSize: fontSize,
        speed: speed,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    TelopContentEqinfoState,
    TelopContentEqinfoStateModel
  >
  createElement() {
    return _TelopContentEqinfoStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelopContentEqinfoStateProvider &&
        other.text == text &&
        other.fontSize == fontSize &&
        other.speed == speed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, fontSize.hashCode);
    hash = _SystemHash.combine(hash, speed.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TelopContentEqinfoStateRef
    on AutoDisposeNotifierProviderRef<TelopContentEqinfoStateModel> {
  /// The parameter `text` of this provider.
  dynamic get text;

  /// The parameter `fontSize` of this provider.
  dynamic get fontSize;

  /// The parameter `speed` of this provider.
  dynamic get speed;
}

class _TelopContentEqinfoStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TelopContentEqinfoState,
          TelopContentEqinfoStateModel
        >
    with TelopContentEqinfoStateRef {
  _TelopContentEqinfoStateProviderElement(super.provider);

  @override
  dynamic get text => (origin as TelopContentEqinfoStateProvider).text;
  @override
  dynamic get fontSize => (origin as TelopContentEqinfoStateProvider).fontSize;
  @override
  dynamic get speed => (origin as TelopContentEqinfoStateProvider).speed;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
