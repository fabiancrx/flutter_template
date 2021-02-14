
///Manager contract for a collection of objects with all basic operations
/// BREAD is like CRUD but it separates the read noun into read and browse.
///This classes are meant to be extended in a viewModel or Provider in which
/// the state of application data is modified to provide a coherent signature to those classes.
abstract class Bread<T> implements Browse<T>, Read<T>, Edit<T>, Add<T>, Delete<T> {}

/// Manages a group of items 'Is a good target when you have to show a list of elements'
/// this corresponds to models which you may retrieve many instances from.
abstract class Browse<T> {
  List<T> data;

  Future<List<T>> browse({String filter});
}

/// Manages a single Item whether you have access only to one instance (eg: user_preferences) or
/// the detail view of each of the browsed Items.
abstract class Read<T> {
  T selected;

  Future<T> read(String id);
}

/// Manages the edition of an item which is basically an Add with pre filled data.
abstract class Edit<T> {
  Future<bool> edit(T item);
}

/// Manages the addition of new items
abstract class Add<T> {
  Future<bool> add(T item);
}

/// Manages the deletion of an existing item
abstract class Delete<T> {
  Future<bool> delete(String id, {T item});
}
