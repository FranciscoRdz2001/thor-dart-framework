/// Unique identifier for components and nodes, enabling stable reconciliation
/// when reordering lists.
abstract class Key {
  const Key();
}

/// A key that uses value equality.
class ValueKey<T> extends Key {
  final T value;

  const ValueKey(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueKey<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueKey($value)';
}

/// A key using object identity (each instance is unique).
class UniqueKey extends Key {
  UniqueKey();

  @override
  String toString() => 'UniqueKey#${hashCode.toRadixString(16)}';
}
