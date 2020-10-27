// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final String name;
  final int price;
  final String count;
  final int cafeID;
  final int orderSeq;
  Order(
      {@required this.name,
      @required this.price,
      @required this.count,
      @required this.cafeID,
      this.orderSeq});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Order(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      price: intType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      count:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}count']),
      cafeID:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}cafe_i_d']),
      orderSeq:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}order_seq']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<String>(count);
    }
    if (!nullToAbsent || cafeID != null) {
      map['cafe_i_d'] = Variable<int>(cafeID);
    }
    if (!nullToAbsent || orderSeq != null) {
      map['order_seq'] = Variable<int>(orderSeq);
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
      orderSeq: orderSeq == null && nullToAbsent
          ? const Value.absent()
          : Value(orderSeq),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
      count: serializer.fromJson<String>(json['count']),
      cafeID: serializer.fromJson<int>(json['cafeID']),
      orderSeq: serializer.fromJson<int>(json['orderSeq']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
      'count': serializer.toJson<String>(count),
      'cafeID': serializer.toJson<int>(cafeID),
      'orderSeq': serializer.toJson<int>(orderSeq),
    };
  }

  Order copyWith(
          {String name, int price, String count, int cafeID, int orderSeq}) =>
      Order(
        name: name ?? this.name,
        price: price ?? this.price,
        count: count ?? this.count,
        cafeID: cafeID ?? this.cafeID,
        orderSeq: orderSeq ?? this.orderSeq,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('count: $count, ')
          ..write('cafeID: $cafeID, ')
          ..write('orderSeq: $orderSeq')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(price.hashCode,
          $mrjc(count.hashCode, $mrjc(cafeID.hashCode, orderSeq.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.name == this.name &&
          other.price == this.price &&
          other.count == this.count &&
          other.cafeID == this.cafeID &&
          other.orderSeq == this.orderSeq);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> name;
  final Value<int> price;
  final Value<String> count;
  final Value<int> cafeID;
  final Value<int> orderSeq;
  const OrdersCompanion({
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.count = const Value.absent(),
    this.cafeID = const Value.absent(),
    this.orderSeq = const Value.absent(),
  });
  OrdersCompanion.insert({
    @required String name,
    @required int price,
    @required String count,
    @required int cafeID,
    this.orderSeq = const Value.absent(),
  })  : name = Value(name),
        price = Value(price),
        count = Value(count),
        cafeID = Value(cafeID);
  static Insertable<Order> custom({
    Expression<String> name,
    Expression<int> price,
    Expression<String> count,
    Expression<int> cafeID,
    Expression<int> orderSeq,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (count != null) 'count': count,
      if (cafeID != null) 'cafe_i_d': cafeID,
      if (orderSeq != null) 'order_seq': orderSeq,
    });
  }

  OrdersCompanion copyWith(
      {Value<String> name,
      Value<int> price,
      Value<String> count,
      Value<int> cafeID,
      Value<int> orderSeq}) {
    return OrdersCompanion(
      name: name ?? this.name,
      price: price ?? this.price,
      count: count ?? this.count,
      cafeID: cafeID ?? this.cafeID,
      orderSeq: orderSeq ?? this.orderSeq,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (count.present) {
      map['count'] = Variable<String>(count.value);
    }
    if (cafeID.present) {
      map['cafe_i_d'] = Variable<int>(cafeID.value);
    }
    if (orderSeq.present) {
      map['order_seq'] = Variable<int>(orderSeq.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('count: $count, ')
          ..write('cafeID: $cafeID, ')
          ..write('orderSeq: $orderSeq')
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
  GeneratedIntColumn _price;
  @override
  GeneratedIntColumn get price => _price ??= _constructPrice();
  GeneratedIntColumn _constructPrice() {
    return GeneratedIntColumn(
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
  GeneratedIntColumn _cafeID;
  @override
  GeneratedIntColumn get cafeID => _cafeID ??= _constructCafeID();
  GeneratedIntColumn _constructCafeID() {
    return GeneratedIntColumn(
      'cafe_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderSeqMeta = const VerificationMeta('orderSeq');
  GeneratedIntColumn _orderSeq;
  @override
  GeneratedIntColumn get orderSeq => _orderSeq ??= _constructOrderSeq();
  GeneratedIntColumn _constructOrderSeq() {
    return GeneratedIntColumn('order_seq', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [name, price, count, cafeID, orderSeq];
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
    if (data.containsKey('order_seq')) {
      context.handle(_orderSeqMeta,
          orderSeq.isAcceptableOrUnknown(data['order_seq'], _orderSeqMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderSeq};
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
