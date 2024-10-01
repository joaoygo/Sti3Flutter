import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:list_order/data/api_service.dart';
import 'package:list_order/models/order_model.dart';
import 'dart:developer' as developer;

class OrderController extends GetxController {
  var dataList = <OrderModel>[].obs;
  var isLoading = true.obs;
  var selectedFilterType = 'Sem filtro'.obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      selectedFilterType.value = 'Sem filtro';
      var data = await ApiService().fetchData();
      if (data.isNotEmpty) {
        dataList.assignAll(data);
      }
    } catch (e) {
      developer.log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void setSelectedFilterType(String newFilter) {
    selectedFilterType.value = newFilter;
  }

  Future<void> fetchDataFilter(String filter) async {
    try {
      isLoading(true);
      var box = await Hive.openBox<OrderModel>('orders');
      var orders = box.values.toList();
      switch (selectedFilterType.value) {
        case 'Cliente':
          orders = orders
              .where((order) =>
                  order.dataCriacao != null &&
                  order.cliente!.nome!.contains(filter))
              .toList();
          break;
        case 'Status':
          orders = orders
              .where((order) => order.status == filter.toUpperCase())
              .toList();
          break;
        case 'Mês de criação':
          orders = orders
              .where((order) =>
                  order.dataCriacao != null &&
                  order.dataCriacao!.month.toString().contains(filter))
              .toList();
          break;
        case 'Numero':
          orders = orders
              .where((order) => order.numero.toString() == filter)
              .toList();
          break;
        case 'Total':
          orders = orders
              .where((order) => order.valorTotal.toString() == filter)
              .toList();
          break;
        default:
          orders = box.values.toList();
          break;
      }

      if (orders.isNotEmpty) {
        dataList.assignAll(orders);
      } else {
        dataList.clear();
      }
    } catch (e) {
      developer.log("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
