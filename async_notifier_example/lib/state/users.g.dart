// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $UsersHash() => r'ea26b7e5135ec4ba2124679f4e42fb954687838f';

/// See also [Users].
class UsersProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Users, List<User>> {
  UsersProvider(
    this.namePart,
    this.olderThan,
  ) : super(
          () => Users()
            ..namePart = namePart
            ..olderThan = olderThan,
          from: usersProvider,
          name: r'usersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : $UsersHash,
        );

  final String namePart;
  final int olderThan;

  @override
  bool operator ==(Object other) {
    return other is UsersProvider &&
        other.namePart == namePart &&
        other.olderThan == olderThan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, namePart.hashCode);
    hash = _SystemHash.combine(hash, olderThan.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<User>> runNotifierBuild(
    covariant _$Users notifier,
  ) {
    return notifier.build(
      namePart,
      olderThan,
    );
  }
}

typedef UsersRef = AutoDisposeAsyncNotifierProviderRef<List<User>>;

/// See also [Users].
final usersProvider = UsersFamily();

class UsersFamily extends Family<AsyncValue<List<User>>> {
  UsersFamily();

  UsersProvider call(
    String namePart,
    int olderThan,
  ) {
    return UsersProvider(
      namePart,
      olderThan,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<Users, List<User>> getProviderOverride(
    covariant UsersProvider provider,
  ) {
    return call(
      provider.namePart,
      provider.olderThan,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'usersProvider';
}

abstract class _$Users extends BuildlessAutoDisposeAsyncNotifier<List<User>> {
  late final String namePart;
  late final int olderThan;

  FutureOr<List<User>> build(
    String namePart,
    int olderThan,
  );
}
