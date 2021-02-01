///Manager contract of a collection of objects with all basic BREAD operations

abstract class Bread<T> implements Browse<T>, Read<T>, Edit<T>, Add<T>, Delete<T> {}

abstract class Browse<T> {
  List<T> data;

  Future<List<T>> browse({String filter});
}

abstract class Read<T> {
  T selected;
  Future<T> read(String id);
}

abstract class Edit<T> {
  Future<bool> edit(T item);
}

abstract class Add<T> {
  Future<bool> add(T item);
}

abstract class Delete<T> {
  Future<bool> delete(String id, {T item});
}
