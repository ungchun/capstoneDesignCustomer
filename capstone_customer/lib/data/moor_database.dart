import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Orders extends Table {
  TextColumn get name => text()();
  // IntColumn get price =>integer()();
  TextColumn get price => text()();
  TextColumn get count => text()();
  IntColumn get cafeID => integer().autoIncrement()();

  @override
  Set<Column> get primaryKey => {cafeID};
}

@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Order>> getAllOrders() => select(orders).get();
  Stream<List<Order>> watchOrders() => select(orders).watch();
  Future insertOrder(Order order) => into(orders).insert(order);
  Future updateOrder(Order order) => update(orders).replace(order);
  Future deleteOrder(Order order) => delete(orders).delete(order);
  deleteAllOrder() => delete(orders).go();
}

AppDatabase moor;
AppDatabase get getMoordb {
  return moor ??= AppDatabase();
}
