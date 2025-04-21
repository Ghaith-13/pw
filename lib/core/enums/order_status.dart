/// Enum representing the different statuses an order can have
enum OrderStatus {
  ordered,
  accepted,
  ready,
  served;

  /// Get display name for the status
  String get displayName {
    switch (this) {
      case OrderStatus.ordered:
        return 'Ordered';
      case OrderStatus.accepted:
        return 'Accepted';
      case OrderStatus.ready:
        return 'Ready';
      case OrderStatus.served:
        return 'Served';
    }
  }

  /// Get status from string
  static OrderStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'ordered':
        return OrderStatus.ordered;
      case 'accepted':
        return OrderStatus.accepted;
      case 'ready':
        return OrderStatus.ready;
      case 'served':
        return OrderStatus.served;
      default:
        return OrderStatus.ordered;
    }
  }
}
