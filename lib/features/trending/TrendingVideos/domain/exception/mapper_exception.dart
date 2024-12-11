class MapperException<From, To> implements Exception {
  final String message;

  MapperException(this.message);

  @override
  String toString() => message;
}
