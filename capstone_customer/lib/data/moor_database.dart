import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Orders extends Table {
  TextColumn get name => text()();
  IntColumn get price =>integer()();
  // TextColumn get price => text()();
  IntColumn get count => integer()();
  IntColumn get cafeID => integer()();
  IntColumn get orderSeq => integer().autoIncrement()();

  @override
  Set<Column> get primaryKey => {orderSeq};
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
