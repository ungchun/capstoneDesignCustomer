// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  String name;
  String price;
  String count;
  String cafeID;
  Order(
      {@required this.name,
      @required this.price,
      @required this.count,
      @required this.cafeID});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Order(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      count:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}count']),
      cafeID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cafe_i_d']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<String>(count);
    }
    if (!nullToAbsent || cafeID != null) {
      map['cafe_i_d'] = Variable<String>(cafeID);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      count:
          count == null && nullToAbsent ? const Value.absent() : Value(count),
      cafeID:
          cafeID == null && nullToAbsent ? const Value.absent() : Value(cafeID),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<String>(json['price']),
      count: serializer.fromJson<String>(json['count']),
      cafeID: serializer.fromJson<String>(json['cafeID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<String>(price),
      'count': serializer.toJson<String>(count),
      'cafeID': serializer.toJson<String>(cafeID),
    };
  }

  Order copyWith({String name, String price, String count, String cafeID}) =>
      Order(
        name: name ?? this.name,
        price: price ?? this.price,
        count: count ?? this.count,
        cafeID: cafeID ?? this.cafeID,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('count: $count, ')
          ..write('cafeID: $cafeID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode,
      $mrjc(price.hashCode, $mrjc(count.hashCode, cafeID.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.name == this.name &&
          other.price == this.price &&
          other.count == this.count &&
          other.cafeID == this.cafeID);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> name;
  final Value<String> price;
  final Value<String> count;
  final Value<String> cafeID;
  const OrdersCompanion({
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.count = const Value.absent(),
    this.cafeID = const Value.absent(),
  });
  OrdersCompanion.insert({
    @required String name,
    @required String price,
    @required String count,
    @required String cafeID,
  })  : name = Value(name),
        price = Value(price),
        count = Value(count),
        cafeID = Value(cafeID);
  static Insertable<Order> custom({
    Expression<String> name,
    Expression<String> price,
    Expression<String> count,
    Expression<String> cafeID,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (count != null) 'count': count,
      if (cafeID != null) 'cafe_i_d': cafeID,
    });
  }

  OrdersCompanion copyWith(
      {Value<String> name,
      Value<String> price,
      Value<String> count,
      Value<String> cafeID}) {
    return OrdersCompanion(
      name: name ?? this.name,
      price: price ?? this.price,
      count: count ?? this.count,
      cafeID: cafeID ?? this.cafeID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (count.present) {
      map['count'] = Variable<String>(count.value);
    }
    if (cafeID.present) {
      map['cafe_i_d'] = Variable<String>(cafeID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('count: $count, ')
          ..write('cafeID: $cafeID')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countMeta = const VerificationMeta('count');
  GeneratedTextColumn _count;
  @override
  GeneratedTextColumn get count => _count ??= _constructCount();
  GeneratedTextColumn _constructCount() {
    return GeneratedTextColumn(
      'count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cafeIDMeta = const VerificationMeta('cafeID');
  GeneratedTextColumn _cafeID;
  @override
  GeneratedTextColumn get cafeID => _cafeID ??= _constructCafeID();
  GeneratedTextColumn _constructCafeID() {
    return GeneratedTextColumn(
      'cafe_i_d',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, price, count, cafeID];
  @override
  $OrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'orders';
  @override
  final String actualTableName = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count'], _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('cafe_i_d')) {
      context.handle(_cafeIDMeta,
          cafeID.isAcceptableOrUnknown(data['cafe_i_d'], _cafeIDMeta));
    } else if (isInserting) {
      context.missing(_cafeIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
