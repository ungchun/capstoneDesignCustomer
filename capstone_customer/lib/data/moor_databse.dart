import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Order extends Table{
  TextColumn get name => text()();
  TextColumn get price => text()();
  TextColumn get count => text()();
  TextColumn get cafeID => text()();
}

@UseMoor(tables: [Order])
class AppDatabase extends _$AppDatabase{
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
}

AppDatabase moor;
AppDatabase get getMoordb {
  return moor ??= AppDatabase();
}