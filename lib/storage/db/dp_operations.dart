

abstract class DbOperation<T>{


  /**
   * //CRUD
   * C create
   * R read
   * U update
   * D delete
   */
  Future<int> create(T object);
  Future<List<T>> read();

  Future<bool> update(T object);
  Future<bool> delete(int id);

  Future<T?>show(int id);

}