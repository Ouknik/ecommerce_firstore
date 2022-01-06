import 'package:firebasegetex/constance.dart';
import 'package:firebasegetex/model/cart_product_model.dart';
import 'package:firebasegetex/model/products_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CordDatabaseHelper {
  CordDatabaseHelper._();

  static final CordDatabaseHelper db = CordDatabaseHelper._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
      CREATE TABLE $tableCartProducts (
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnProductsId TEXT NOT NULL)
      ''');
    });
  }

  Future<List<CartProductsModel>> getAllProdects() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProducts);
    List<CartProductsModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductsModel.fromJson(product)).toList()
        : [];
    return list;
  }

  inser(CartProductsModel model) async {
    var dbClient = await database;

    await dbClient!.insert(tableCartProducts, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProducts(CartProductsModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProducts, model.toJson(),
        where: '$columnProductsId=?', whereArgs: [model.productsId]);
  }

  removeProducs(CartProductsModel model) async {
    var dbClient = await database;
    return await dbClient!.delete(tableCartProducts,
        where: '$columnProductsId=?', whereArgs: [model.productsId]);
  }
}
