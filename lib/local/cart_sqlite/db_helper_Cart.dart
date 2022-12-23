import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Cart_sql.dart';

final String columnId = 'id';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnName = 'name';
final String cartTable = 'cart_table';

class CartHelper {
  late Database db;
  static final CartHelper instance = CartHelper._internal();

  factory CartHelper() {
    return instance;
  }
  CartHelper._internal();
  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'cart_List.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
          create table cartTable (
          $columnId integer primary key autoincrement,
          $columnPrice real not null,
          $columnImage text not null,
          $columnName text not null
          )
          ''');
        });
  }

  Future<int?> insertCart(Carts cart) async {
    cart.id = await db.insert('cartTable', cart.toMap());
    return cart.id ;
  }

  Future<int> deleteCart(int id) async {
    return await db
        .delete('cartTable', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Carts>> getAllCarts() async {
    List<Map<String, dynamic>> CartMaps = await db.query('cartTable');
    if (CartMaps.isEmpty) {
      return [];
    } else {
      List<Carts> carts = [];
      for (var element in CartMaps) {
        carts.add(Carts.fromMap(element));
      }
      return carts;
    }
  }

  Future close() async => db.close();
}
