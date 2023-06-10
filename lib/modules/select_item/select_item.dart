import 'dart:developer';

import 'package:crypto/components/components.dart';
import 'package:crypto/layout/cubit/cubit.dart';
import 'package:crypto/layout/cubit/states.dart';
import 'package:crypto/models/chartModel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectItem extends StatefulWidget {
  int index;
  SelectItem({required this.index});

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  late TrackballBehavior trackballBehavior;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoCubit, CryptoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CryptoCubit.get(context);

        return Builder(builder: (context) {
          if (cubit.chartModel.isEmpty) {
            trackballBehavior = TrackballBehavior(
                enable: true, activationMode: ActivationMode.singleTap);
            cubit.getBitcoinFromApi(
                name: cubit.coinMarket[widget.index].id, days: cubit.days);
          }
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          cubit.coinMarket[widget.index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.coinMarket[widget.index].name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(cubit.coinMarket[widget.index].symbol,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12,
                              ))
                        ],
                      ),
                      const Spacer(),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$ ${cubit.coinMarket[widget.index].currentPrice}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "${cubit.coinMarket[widget.index].marketCapChangePercentage24H} %",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                ))
                          ])
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      priceOfCoin(
                          type: "Low",
                          price:
                              cubit.coinMarket[widget.index].low24H.toString()),
                      priceOfCoin(
                          type: "High",
                          price: cubit.coinMarket[widget.index].high24H
                              .toString()),
                      priceOfCoin(
                          type: "Vol",
                          price: cubit.coinMarket[widget.index].totalVolume
                              .toString()),
                    ],
                  ),
                  if (cubit.chartModel.isEmpty)
                    const SizedBox(
                      width: double.infinity,
                      height: 200,
                    ),
                  if (cubit.chartModel.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: SfCartesianChart(
                        trackballBehavior: trackballBehavior,
                        zoomPanBehavior: ZoomPanBehavior(
                            enablePanning: true, zoomMode: ZoomMode.x),
                        series: <CandleSeries>[
                          CandleSeries<ChartModel, int>(
                              enableSolidCandles: true,
                              enableTooltip: true,
                              bullColor: Colors.green,
                              bearColor: Colors.red,
                              dataSource: cubit.chartModel,
                              xValueMapper: (ChartModel sales, _) => sales.time,
                              lowValueMapper: (ChartModel sales, _) =>
                                  sales.low,
                              highValueMapper: (ChartModel sales, _) =>
                                  sales.high,
                              openValueMapper: (ChartModel sales, _) =>
                                  sales.open,
                              closeValueMapper: (ChartModel sales, _) =>
                                  sales.close,
                              animationDuration: 55)
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      choose(
                          text: cubit.text[0],
                          function: () {
                            cubit.setDays(cubit.text[0],
                                cubit.coinMarket[widget.index].id, 0);
                          },
                          indexOfBool: cubit.boolText[0]),
                      const SizedBox(
                        width: 10,
                      ),
                      choose(
                          text: cubit.text[1],
                          function: () {
                            cubit.setDays(cubit.text[1],
                                cubit.coinMarket[widget.index].id, 1);
                          },
                          indexOfBool: cubit.boolText[1]),
                      const SizedBox(
                        width: 10,
                      ),
                      choose(
                          text: cubit.text[2],
                          function: () {
                            cubit.setDays(cubit.text[2],
                                cubit.coinMarket[widget.index].id, 2);
                          },
                          indexOfBool: cubit.boolText[2]),
                      const SizedBox(
                        width: 10,
                      ),
                      choose(
                          text: cubit.text[3],
                          function: () {
                            cubit.setDays(cubit.text[3],
                                cubit.coinMarket[widget.index].id, 3);
                            log("${cubit.boolText}");
                          },
                          indexOfBool: cubit.boolText[3]),
                      const SizedBox(
                        width: 10,
                      ),
                      choose(
                          text: cubit.text[4],
                          function: () {
                            cubit.setDays(cubit.text[4],
                                cubit.coinMarket[widget.index].id, 4);
                          },
                          indexOfBool: cubit.boolText[4]),
                      const SizedBox(
                        width: 10,
                      ),
                      choose(
                          text: cubit.text[5],
                          function: () {
                            cubit.setDays(cubit.text[5],
                                cubit.coinMarket[widget.index].id, 5);
                          },
                          indexOfBool: cubit.boolText[5]),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.7,
                          endIndent: double.infinity,
                          height: 0.8,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Add to protfolio",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(0.7)),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(
                                    EvaIcons.bell,
                                    size: 26,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          );
        });
      },
    );
  }
}
