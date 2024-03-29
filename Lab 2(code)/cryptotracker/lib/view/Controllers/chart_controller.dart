import 'package:cryptotracker/models/chartModel.dart';
import 'package:cryptotracker/models/coinModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChartController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ChartModel> chart_list = <ChartModel>[].obs;
  int days = 1;

  Coin? current_coin;
  ChartController();

  @override
  onInit() {
    super.onInit();
    if (current_coin != null) {
      fetchChart();
    }
  }

  void setCurrentCoin(Coin coin, [int days_range = 1]) {
    current_coin = coin;
    days = days_range;
    fetchChart();
  }

  void setDays(int days_range) {
    days = days_range;
    fetchChart();
  }

  fetchChart() async {
    try {
      isLoading(true);
      String url = 'https://api.coingecko.com/api/v3/coins/' +
          current_coin!.id.toString() +
          '/ohlc?vs_currency=usd&days=' +
          days.toString();

      var response = await http.get(Uri.parse(url));

      List<ChartModel> charts = ChartFromJson(response.body);
      if (charts.isNotEmpty) {
        chart_list.assignAll(charts);
        print("A pochemy togda");
      } else {
        print('No data available in');
      }
    } finally {
      isLoading(false);
    }
  }
}
