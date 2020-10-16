import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Orders extends Table {
  TextColumn get name => text()();
  TextColumn get price => text()();
  TextColumn get count => text()();
  TextColumn get cafeID => text()();
}

@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Order>> getAllProducts() => select(orders).get();
  Stream<List<Order>> watchProducts() => select(orders).watch();
  Future insertProduct(Order order) => into(orders).insert(order);
  Future updateProduct(Order order) => update(orders).replace(order);
  Future deleteProduct(Order order) => delete(orders).delete(order);
  deleteAllProduct() => delete(orders).go();
}
