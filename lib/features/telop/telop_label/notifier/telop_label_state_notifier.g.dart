// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telop_label_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telopLabelStateHash() => r'773c5cf5648a9d98adb5a5728cc6373a3f5948e9';

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

abstract class _$TelopLabelState
    extends BuildlessAutoDisposeNotifier<TelopLabelStateModel> {
  late final dynamic width;
  late final dynamic text;
  late final dynamic bgColor;
  late final dynamic fontColor;
  late final dynamic fontSize;
  late final dynamic fontFamily;

  TelopLabelStateModel build({
    dynamic width = TelopLabelState.defaultWidth,
    dynamic text = TelopLabelState.defaultInitialText,
    dynamic bgColor = TelopLabelState.defaultBgColor,
    dynamic fontColor = TelopLabelState.defaultFontColor,
    dynamic fontSize = TelopLabelState.defaultFontSize,
    dynamic fontFamily = TelopLabelState.defaultFontFamily,
  });
}

/// See also [TelopLabelState].
@ProviderFor(TelopLabelState)
const telopLabelStateProvider = TelopLabelStateFamily();

/// See also [TelopLabelState].
class TelopLabelStateFamily extends Family<TelopLabelStateModel> {
  /// See also [TelopLabelState].
  const TelopLabelStateFamily();

  /// See also [TelopLabelState].
  TelopLabelStateProvider call({
    dynamic width = TelopLabelState.defaultWidth,
    dynamic text = TelopLabelState.defaultInitialText,
    dynamic bgColor = TelopLabelState.defaultBgColor,
    dynamic fontColor = TelopLabelState.defaultFontColor,
    dynamic fontSize = TelopLabelState.defaultFontSize,
    dynamic fontFamily = TelopLabelState.defaultFontFamily,
  }) {
    return TelopLabelStateProvider(
      width: width,
      text: text,
      bgColor: bgColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );
  }

  @override
  TelopLabelStateProvider getProviderOverride(
    covariant TelopLabelStateProvider provider,
  ) {
    return call(
      width: provider.width,
      text: provider.text,
      bgColor: provider.bgColor,
      fontColor: provider.fontColor,
      fontSize: provider.fontSize,
      fontFamily: provider.fontFamily,
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
  String? get name => r'telopLabelStateProvider';
}

/// See also [TelopLabelState].
class TelopLabelStateProvider
    extends
        AutoDisposeNotifierProviderImpl<TelopLabelState, TelopLabelStateModel> {
  /// See also [TelopLabelState].
  TelopLabelStateProvider({
    dynamic width = TelopLabelState.defaultWidth,
    dynamic text = TelopLabelState.defaultInitialText,
    dynamic bgColor = TelopLabelState.defaultBgColor,
    dynamic fontColor = TelopLabelState.defaultFontColor,
    dynamic fontSize = TelopLabelState.defaultFontSize,
    dynamic fontFamily = TelopLabelState.defaultFontFamily,
  }) : this._internal(
         () =>
             TelopLabelState()
               ..width = width
               ..text = text
               ..bgColor = bgColor
               ..fontColor = fontColor
               ..fontSize = fontSize
               ..fontFamily = fontFamily,
         from: telopLabelStateProvider,
         name: r'telopLabelStateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$telopLabelStateHash,
         dependencies: TelopLabelStateFamily._dependencies,
         allTransitiveDependencies:
             TelopLabelStateFamily._allTransitiveDependencies,
         width: width,
         text: text,
         bgColor: bgColor,
         fontColor: fontColor,
         fontSize: fontSize,
         fontFamily: fontFamily,
       );

  TelopLabelStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.width,
    required this.text,
    required this.bgColor,
    required this.fontColor,
    required this.fontSize,
    required this.fontFamily,
  }) : super.internal();

  final dynamic width;
  final dynamic text;
  final dynamic bgColor;
  final dynamic fontColor;
  final dynamic fontSize;
  final dynamic fontFamily;

  @override
  TelopLabelStateModel runNotifierBuild(covariant TelopLabelState notifier) {
    return notifier.build(
      width: width,
      text: text,
      bgColor: bgColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );
  }

  @override
  Override overrideWith(TelopLabelState Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelopLabelStateProvider._internal(
        () =>
            create()
              ..width = width
              ..text = text
              ..bgColor = bgColor
              ..fontColor = fontColor
              ..fontSize = fontSize
              ..fontFamily = fontFamily,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        width: width,
        text: text,
        bgColor: bgColor,
        fontColor: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TelopLabelState, TelopLabelStateModel>
  createElement() {
    return _TelopLabelStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelopLabelStateProvider &&
        other.width == width &&
        other.text == text &&
        other.bgColor == bgColor &&
        other.fontColor == fontColor &&
        other.fontSize == fontSize &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, width.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, bgColor.hashCode);
    hash = _SystemHash.combine(hash, fontColor.hashCode);
    hash = _SystemHash.combine(hash, fontSize.hashCode);
    hash = _SystemHash.combine(hash, fontFamily.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TelopLabelStateRef
    on AutoDisposeNotifierProviderRef<TelopLabelStateModel> {
  /// The parameter `width` of this provider.
  dynamic get width;

  /// The parameter `text` of this provider.
  dynamic get text;

  /// The parameter `bgColor` of this provider.
  dynamic get bgColor;

  /// The parameter `fontColor` of this provider.
  dynamic get fontColor;

  /// The parameter `fontSize` of this provider.
  dynamic get fontSize;

  /// The parameter `fontFamily` of this provider.
  dynamic get fontFamily;
}

class _TelopLabelStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TelopLabelState,
          TelopLabelStateModel
        >
    with TelopLabelStateRef {
  _TelopLabelStateProviderElement(super.provider);

  @override
  dynamic get width => (origin as TelopLabelStateProvider).width;
  @override
  dynamic get text => (origin as TelopLabelStateProvider).text;
  @override
  dynamic get bgColor => (origin as TelopLabelStateProvider).bgColor;
  @override
  dynamic get fontColor => (origin as TelopLabelStateProvider).fontColor;
  @override
  dynamic get fontSize => (origin as TelopLabelStateProvider).fontSize;
  @override
  dynamic get fontFamily => (origin as TelopLabelStateProvider).fontFamily;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
