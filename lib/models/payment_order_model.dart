class OrderModel {
  final dynamic cartDetails;
  final String? cfOrderId;
  final DateTime? createdAt;
  final CustomerDetails? customerDetails;
  final String? entity;
  final double? orderAmount;
  final String? orderCurrency;
  final DateTime? orderExpiryTime;
  final String? orderId;
  final OrderMeta? orderMeta;
  final String? orderNote;
  final List<dynamic>? orderSplits;
  final String? orderStatus;
  final dynamic orderTags;
  final String? paymentSessionId;
  final dynamic terminalData;

  OrderModel({
    this.cartDetails,
    this.cfOrderId,
    this.createdAt,
    this.customerDetails,
    this.entity,
    this.orderAmount,
    this.orderCurrency,
    this.orderExpiryTime,
    this.orderId,
    this.orderMeta,
    this.orderNote,
    this.orderSplits,
    this.orderStatus,
    this.orderTags,
    this.paymentSessionId,
    this.terminalData,
  });

  // From JSON method
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      cartDetails: json['cart_details'],
      cfOrderId: json['cf_order_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      customerDetails: json['customer_details'] != null
          ? CustomerDetails.fromJson(json['customer_details'])
          : null,
      entity: json['entity'],
      orderAmount: (json['order_amount'] as num?)?.toDouble(),
      orderCurrency: json['order_currency'],
      orderExpiryTime: json['order_expiry_time'] != null
          ? DateTime.parse(json['order_expiry_time'])
          : null,
      orderId: json['order_id'],
      orderMeta: json['order_meta'] != null
          ? OrderMeta.fromJson(json['order_meta'])
          : null,
      orderNote: json['order_note'],
      orderSplits: json['order_splits'] as List<dynamic>?,
      orderStatus: json['order_status'],
      orderTags: json['order_tags'],
      paymentSessionId: json['payment_session_id'],
      terminalData: json['terminal_data'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'cart_details': cartDetails,
      'cf_order_id': cfOrderId,
      'created_at': createdAt?.toIso8601String(),
      'customer_details': customerDetails?.toJson(),
      'entity': entity,
      'order_amount': orderAmount,
      'order_currency': orderCurrency,
      'order_expiry_time': orderExpiryTime?.toIso8601String(),
      'order_id': orderId,
      'order_meta': orderMeta?.toJson(),
      'order_note': orderNote,
      'order_splits': orderSplits,
      'order_status': orderStatus,
      'order_tags': orderTags,
      'payment_session_id': paymentSessionId,
      'terminal_data': terminalData,
    };
  }

  @override
  String toString() {
    return 'OrderModel(cfOrderId: $cfOrderId, createdAt: $createdAt, customerDetails: $customerDetails, entity: $entity, orderAmount: $orderAmount, orderCurrency: $orderCurrency, orderId: $orderId)';
  }
}

class CustomerDetails {
  final String? customerId;
  final String? customerName;
  final String? customerEmail;
  final String? customerPhone;
  final dynamic customerUid;

  CustomerDetails({
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.customerUid,
  });

  // From JSON method
  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      customerEmail: json['customer_email'],
      customerPhone: json['customer_phone'],
      customerUid: json['customer_uid'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'customer_phone': customerPhone,
      'customer_uid': customerUid,
    };
  }

  @override
  String toString() {
    return 'CustomerDetails(customerId: $customerId, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone)';
  }
}

class OrderMeta {
  final dynamic returnUrl;
  final dynamic notifyUrl;
  final String? paymentMethods;

  OrderMeta({
    this.returnUrl,
    this.notifyUrl,
    this.paymentMethods,
  });

  // From JSON method
  factory OrderMeta.fromJson(Map<String, dynamic> json) {
    return OrderMeta(
      returnUrl: json['return_url'],
      notifyUrl: json['notify_url'],
      paymentMethods: json['payment_methods'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'return_url': returnUrl,
      'notify_url': notifyUrl,
      'payment_methods': paymentMethods,
    };
  }

  @override
  String toString() {
    return 'OrderMeta(returnUrl: $returnUrl, notifyUrl: $notifyUrl, paymentMethods: $paymentMethods)';
  }
}
