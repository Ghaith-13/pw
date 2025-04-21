import '../enums/order_status.dart';

/// Model class representing an order
class Order {
  final String id;
  final String customerName;
  final String customerTable;
  final double totalAmount;
  final OrderStatus status;
  final DateTime createdAt;
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.customerName,
    required this.customerTable,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.items,
  });

  /// Create an Order from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      customerName: json['customerName'] as String,
      customerTable: json['customerTable'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: OrderStatus.fromString(json['status'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convert Order to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerName': customerName,
      'customerTable': customerTable,
      'totalAmount': totalAmount,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  /// Copy with method to create a new instance with some fields changed
  Order copyWith({
    String? id,
    String? customerName,
    String? customerTable,
    double? totalAmount,
    OrderStatus? status,
    DateTime? createdAt,
    List<OrderItem>? items,
  }) {
    return Order(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      customerTable: customerTable ?? this.customerTable,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
    );
  }
}

/// Model class representing an order item
class OrderItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String? note;

  OrderItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.note,
  });

  /// Create an OrderItem from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      note: json['note'] as String?,
    );
  }

  /// Convert OrderItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'note': note,
    };
  }
}
