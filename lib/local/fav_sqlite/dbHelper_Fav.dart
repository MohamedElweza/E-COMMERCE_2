import 'package:T3ala/local/fav_sqlite/Fav_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String columnId = 'id';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnName = 'name';
 int IsSelected = 0;

class FavProvider {
  late Database db;
  static final FavProvider instance = FavProvider._internal();

  factory FavProvider() {
    return instance;
  }
  FavProvider._internal();
  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'fav_table.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
          create table fav_table (
          $columnId integer primary key autoincrement,
          $columnPrice real not null,
          $columnImage text not null,
          $columnName text not null
          )
          ''');
        });
  }

  Future<int?> insertFev(Fav fav) async {
    fav.id = await db.insert('fav_table', fav.toMap());
    return fav.id ;
  }

  Future<int> deleteFev(int id) async {
    return await db
        .delete('fav_table', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Fav>> getAllFav() async {
    List<Map<String, dynamic>> FavMaps = await db.query('fav_table');
    if (FavMaps.isEmpty) {
      return [];
    } else {
      List<Fav> favs = [];
      for (var element in FavMaps) {
        favs.add(Fav.fromMap(element));
      }
      return favs;
    }
  }

  Future close() async => db.close();
}
