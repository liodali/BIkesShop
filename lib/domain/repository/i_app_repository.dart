abstract class IAppRepository<T> {
  Future<T> getAll();

  Future<T> getAllByFilter(dynamic filter);

  Future<T> getOne(int id);
}
