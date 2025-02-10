// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_product_qualification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationProductQualificationControllerHash() =>
    r'3e4b16454b682045ebb572701588be6fbc62f758';

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

abstract class _$LocationProductQualificationController
    extends BuildlessAutoDisposeAsyncNotifier<QualificationInfoModel> {
  late final String locationId;

  FutureOr<QualificationInfoModel> build(
    String locationId,
  );
}

/// See also [LocationProductQualificationController].
@ProviderFor(LocationProductQualificationController)
const locationProductQualificationControllerProvider =
    LocationProductQualificationControllerFamily();

/// See also [LocationProductQualificationController].
class LocationProductQualificationControllerFamily
    extends Family<AsyncValue<QualificationInfoModel>> {
  /// See also [LocationProductQualificationController].
  const LocationProductQualificationControllerFamily();

  /// See also [LocationProductQualificationController].
  LocationProductQualificationControllerProvider call(
    String locationId,
  ) {
    return LocationProductQualificationControllerProvider(
      locationId,
    );
  }

  @override
  LocationProductQualificationControllerProvider getProviderOverride(
    covariant LocationProductQualificationControllerProvider provider,
  ) {
    return call(
      provider.locationId,
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
  String? get name => r'locationProductQualificationControllerProvider';
}

/// See also [LocationProductQualificationController].
class LocationProductQualificationControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        LocationProductQualificationController, QualificationInfoModel> {
  /// See also [LocationProductQualificationController].
  LocationProductQualificationControllerProvider(
    String locationId,
  ) : this._internal(
          () =>
              LocationProductQualificationController()..locationId = locationId,
          from: locationProductQualificationControllerProvider,
          name: r'locationProductQualificationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationProductQualificationControllerHash,
          dependencies:
              LocationProductQualificationControllerFamily._dependencies,
          allTransitiveDependencies:
              LocationProductQualificationControllerFamily
                  ._allTransitiveDependencies,
          locationId: locationId,
        );

  LocationProductQualificationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locationId,
  }) : super.internal();

  final String locationId;

  @override
  FutureOr<QualificationInfoModel> runNotifierBuild(
    covariant LocationProductQualificationController notifier,
  ) {
    return notifier.build(
      locationId,
    );
  }

  @override
  Override overrideWith(
      LocationProductQualificationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LocationProductQualificationControllerProvider._internal(
        () => create()..locationId = locationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locationId: locationId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      LocationProductQualificationController,
      QualificationInfoModel> createElement() {
    return _LocationProductQualificationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationProductQualificationControllerProvider &&
        other.locationId == locationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocationProductQualificationControllerRef
    on AutoDisposeAsyncNotifierProviderRef<QualificationInfoModel> {
  /// The parameter `locationId` of this provider.
  String get locationId;
}

class _LocationProductQualificationControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        LocationProductQualificationController,
        QualificationInfoModel> with LocationProductQualificationControllerRef {
  _LocationProductQualificationControllerProviderElement(super.provider);

  @override
  String get locationId =>
      (origin as LocationProductQualificationControllerProvider).locationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
