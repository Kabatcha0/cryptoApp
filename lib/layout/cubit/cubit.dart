import 'dart:developer';

import 'package:crypto/layout/cubit/states.dart';
import 'package:crypto/models/chartModel.dart';
import 'package:crypto/models/coinModel.dart';
import 'package:crypto/modules/bell/bell.dart';
import 'package:crypto/modules/compass/compass.dart';
import 'package:crypto/modules/home/home.dart';
import 'package:crypto/modules/person/person.dart';
import 'package:crypto/shared/network/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCubit extends Cubit<CryptoStates> {
  CryptoCubit() : super(CryptoInitialState());
  static CryptoCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void index(int i) {
    currentIndex = i;
    emit(CryptoIndexState());
  }

  List<Widget> body = [HomeScreen(), Compass(), Bell(), Person()];
  List<CoinModel> coinMarket = [];
  void getDataFromApi() {
    emit(CryptoGetMarketLoadingState());
    log("message");
    DioHelper.getData(
        path: "coins/markets",
        json: {"vs_currency": "usd", "sparkline": true}).then((value) {
      value.data.forEach((e) {
        coinMarket.add(CoinModel.fromJson(e));
      });

      emit(CryptoGetMarketSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(CryptoGetMarketErrorState());
    });
  }

  List<ChartModel> chartModel = [];
  void getBitcoinFromApi({
    required String name,
    required int days,
  }) {
    emit(CryptoGetMarketBitcoinLoadingState());
    chartModel = [];
    DioHelper.getData(
        path: "coins/$name/ohlc",
        json: {"vs_currency": "usd", "days": days.toString()}).then((value) {
      value.data.forEach((e) {
        chartModel.add(ChartModel.fromJson(e));
        // log(e.toString());
        emit(CryptoGetMarketBitcoinSuccessState());
      });
    }).catchError((e) {
      log(e.toString());
      emit(CryptoGetMarketBitcoinErrorState());
    });
  }

  List<String> text = ["D", "W", "M", "3M", "6M", "Y"];
  List<bool> boolText = [true, false, false, false, false, false];
  int days = 1;
  void setDays(String txt, String name, int index) {
    if (txt == "D") {
      days = 1;
      boolText = boolText.map((e) => false).toList();

      boolText[index] = true;
      getBitcoinFromApi(name: name, days: days);
      emit(CryptoSetDaysState());
    } else if (txt == "W") {
      days = 7;
      boolText = boolText.map((e) => false).toList();

      boolText[index] = true;

      getBitcoinFromApi(name: name, days: days);
      emit(CryptoSetDaysState());
    } else if (txt == "M") {
      days = 30;
      boolText = boolText.map((e) => false).toList();

      boolText[index] = true;

      getBitcoinFromApi(name: name, days: days);
      emit(CryptoSetDaysState());
    } else if (txt == "3M") {
      days = 90;
      boolText = boolText.map((e) => false).toList();

      boolText[index] = true;

      getBitcoinFromApi(name: name, days: days);
      emit(CryptoSetDaysState());
    } else if (txt == "6M") {
      days = 180;
      boolText = boolText.map((e) => false).toList();
      boolText[index] = true;

      getBitcoinFromApi(name: name, days: days);

      emit(CryptoSetDaysState());
    } else {
      days = 365;
      boolText = boolText.map((e) => false).toList();
      boolText[index] = true;

      getBitcoinFromApi(name: name, days: days);

      emit(CryptoSetDaysState());
    }
    log("$days");
  }
}
