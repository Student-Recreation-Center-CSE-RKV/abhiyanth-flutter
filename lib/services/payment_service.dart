import 'dart:convert';

import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:abhiyanth/models/payment_order_model.dart';
class PaymentService{

  Future<OrderModel> getSessionId() async {
    try {
      final response = await http.get(
        Uri.parse("https://us-central1-abhiyanth-a8d4c.cloudfunctions.net/createOrder"),
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return OrderModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch session ID. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching session ID: $error');
    }
  }
  Future<void> makePayment()async {
    try {
      var cfPaymentGateWay=CFPaymentGatewayService();
      OrderModel paymentSessionId=await getSessionId();
      print(paymentSessionId.paymentSessionId);
      print(paymentSessionId.cfOrderId);

      var session = CFSessionBuilder().setEnvironment(CFEnvironment.SANDBOX).setOrderId(paymentSessionId.cfOrderId as String).setPaymentSessionId(paymentSessionId.paymentSessionId as String).build();
      var cfWebCheckout = CFWebCheckoutPaymentBuilder().setSession(session) .build();
      cfPaymentGateWay.setCallback((orderId){
        print("OrderId");
      }, (error,orderID){
        print(error.getMessage());
      });
      cfPaymentGateWay.doPayment(cfWebCheckout);
    } on CFException catch (e) {
      print(e.message);
    }
  }
}