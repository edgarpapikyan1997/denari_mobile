final class Di {
  final List<dynamic> _objects = [];

  T get<T>() {
    for (var value in _objects) {
      if (value is T) {
        return value;
      }
    }
    throw TypeError;
  }

  add<T>(T object) => _objects.add(object);
}