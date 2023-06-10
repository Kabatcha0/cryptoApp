import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorPushReplacement(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Widget rowChoose({required String data}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.7)),
    child: Text(
      data,
      style: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}

Widget assetBitcoin(
    {required String image,
    required String title,
    required String symbol,
    required String priceChange,
    required double cap,
    required List<double> data}) {
  return Row(
    children: [
      Container(
        height: 45,
        width: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        width: 3,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            symbol,
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      SizedBox(
        width: 100,
        height: 45,
        child: Sparkline(
          data: data,
          lineWidth: 2,
          lineColor: cap >= 0 ? Colors.green : Colors.red,
          fillMode: FillMode.below,
          fillGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.7],
              colors: cap >= 0
                  ? [Colors.green, Colors.green.shade100]
                  : [Colors.red, Colors.red.shade100]),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Text("$priceChange %",
          style: cap >= 0
              ? const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.green)
              : const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.red)),
    ],
  );
}

Widget recommandedBuy(
    {required String image,
    required String title,
    required String currentPrice,
    required String cap,
    required Function() func,
    required double number}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 140,
      height: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.7),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 45,
            width: 45,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$currentPrice",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Text(
                "$cap %",
                style: number >= 0
                    ? const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.green)
                    : const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.red),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

// enum TypeOfColor{
//   low,high,val
// }
// TypeOfColor
Widget priceOfCoin({required String type, required String price}) {
  return Column(
    children: [
      Text(type,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 12,
          )),
      const SizedBox(
        height: 5,
      ),
      Text(
        "\$ $price",
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget choose(
    {required String text,
    required Function() function,
    required bool indexOfBool}) {
  return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: indexOfBool ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(13),
        child: Text(
          text,
          style: TextStyle(
            color: indexOfBool ? Colors.white : Colors.grey,
            fontSize: 14,
          ),
        ),
      ));
}
