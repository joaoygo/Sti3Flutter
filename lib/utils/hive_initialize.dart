import 'package:hive_flutter/hive_flutter.dart';
import 'package:list_order/models/address_model.dart';
import 'package:list_order/models/client_model.dart';
import 'package:list_order/models/itens_model.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/models/payment_model.dart';

class HiveInitializer {
  static Future<void> initHive() async {
    await Future.wait([
      Hive.openBox<ClientModel>('clients'),
      Hive.openBox<PaymentModel>('payments'),
      Hive.openBox<ItensModel>('itens'),
      Hive.openBox<AddressModel>('addresses'),
      Hive.openBox<OrderModel>('orders'),
    ]);
  }

  static Future<void> registerAdapters() async {
    Hive.registerAdapter(ClientModelAdapter());
    Hive.registerAdapter(PaymentModelAdapter());
    Hive.registerAdapter(ItensModelAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    Hive.registerAdapter(OrderModelAdapter());
  }
}
