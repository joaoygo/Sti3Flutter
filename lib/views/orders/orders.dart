import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_order/components/DrawerAppBar/drawer_app_bar.dart';
import 'package:list_order/views/orders/components/Table/table_custom.dart';
import 'package:list_order/controllers/order_controller.dart';
import 'package:list_order/utils/app_colors.dart';
import 'package:list_order/utils/app_str.dart';
import 'package:list_order/utils/capitalize.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStr.orders),
        ),
        drawer: const DrawerAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: AppStr.filter,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          orderController.fetchData();
                        }),
                    prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          orderController
                              .fetchDataFilter(searchController.text);
                        }),
                    contentPadding: const EdgeInsets.all(8.0),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(AppStr.filterBy),
                    const SizedBox(width: 8.0),
                    Expanded(child: Obx(() {
                      return DropdownButton(
                        value: orderController.selectedFilterType.value,
                        isExpanded: true,
                        onChanged: (String? value) {
                          orderController.setSelectedFilterType(value!);
                        },
                        items: <String>[
                          'Sem filtro',
                          'Cliente',
                          'Status',
                          'Mês de criação',
                          'Numero',
                          'Total'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(capitalize(value)),
                          );
                        }).toList(),
                      );
                    }))
                  ],
                )),
            Expanded(
              child: Obx(() {
                if (orderController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (orderController.dataList.isEmpty) {
                  return const Center(
                    child: Text('Sem dados'),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      searchController.clear();
                      await orderController.fetchData();
                    },
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCustom(
                          titlesColumns: const [
                            'N°',
                            'Data',
                            'Cliente',
                            'Status',
                            'Total'
                          ],
                          columnWidths: const {
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(95),
                            2: FixedColumnWidth(80),
                            3: FixedColumnWidth(85),
                            4: FixedColumnWidth(70),
                          },
                          data: orderController,
                        ),
                      ),
                    ]),
                  );
                }
              }),
            ),
          ],
        ));
  }
}
