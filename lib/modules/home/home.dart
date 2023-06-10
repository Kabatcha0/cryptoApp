import 'package:crypto/components/components.dart';
import 'package:crypto/layout/cubit/cubit.dart';
import 'package:crypto/layout/cubit/states.dart';
import 'package:crypto/modules/select_item/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoCubit, CryptoStates>(
        builder: (context, state) {
          var cubit = CryptoCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.orange,
            body: cubit.coinMarket.isEmpty
                ? Container()
                : SafeArea(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 8, end: 8, top: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      rowChoose(data: "Main portfolio"),
                                      rowChoose(data: "Top 10 coins"),
                                      rowChoose(data: "Exprimental"),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4, top: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "7,466.20 dollars",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            "assets/icons/5.1.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    "+162% all time",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60))),
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Assets",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 24,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            assetBitcoin(
                                                cap: cubit.coinMarket[index]
                                                    .marketCapChangePercentage24H,
                                                image: cubit
                                                    .coinMarket[index].image,
                                                title: cubit
                                                    .coinMarket[index].name,
                                                data: cubit.coinMarket[index]
                                                    .sparklineIn7D.price,
                                                symbol: cubit
                                                    .coinMarket[index].symbol,
                                                priceChange: cubit
                                                    .coinMarket[index]
                                                    .priceChange24H
                                                    .toStringAsFixed(1)),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 14,
                                            ),
                                        itemCount: cubit.coinMarket.length),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Recommend to Buy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: 140,
                                child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        recommandedBuy(
                                            func: () {
                                              navigator(
                                                  context: context,
                                                  widget:
                                                      SelectItem(index: index));
                                            },
                                            number: cubit.coinMarket[index]
                                                .marketCapChangePercentage24H,
                                            image:
                                                cubit.coinMarket[index].image,
                                            title: cubit.coinMarket[index].name,
                                            currentPrice: cubit
                                                .coinMarket[index].currentPrice
                                                .toStringAsFixed(2),
                                            cap: cubit.coinMarket[index]
                                                .marketCapChangePercentage24H
                                                .toStringAsFixed(2)),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 22,
                                        ),
                                    itemCount: cubit.coinMarket.length),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 10,
                      )
                    ],
                  )),
          );
        },
        listener: (context, state) {});
  }
}
