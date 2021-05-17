import 'app_database.dart';
import 'painting.dart';
import 'package:sembast/sembast.dart';

class PaintingDao {
  static const String PAINTING_STORE_NAME = 'paintings';
  final _paintingStore = intMapStoreFactory.store(PAINTING_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Painting painting) async {
    await _paintingStore.add(await _db, painting.toMap());
  }

  Future update(Painting painting) async {
    final finder = Finder(filter: Filter.byKey(painting.id));
    await _paintingStore.update(
      await _db,
      painting.toMap(),
      finder: finder,
    );
  }

  Future delete(Painting painting) async {
    final finder = Finder(filter: Filter.byKey(painting.id));
    await _paintingStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Painting>> getAllSortedByAdded() async {
    final finder = Finder(sortOrders: [
      SortOrder('added', false),
    ]);

    final recordSnapshots = await _paintingStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final painting = Painting.fromMap(snapshot.value);
      painting.id = snapshot.key;
      return painting;
    }).toList();
  }

  Future<List<Painting>> getAllSortedByTitle() async {
    final finder = Finder(sortOrders: [
      SortOrder('title'),
    ]);

    final recordSnapshots = await _paintingStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final painting = Painting.fromMap(snapshot.value);
      painting.id = snapshot.key;
      return painting;
    }).toList();
  }
}
