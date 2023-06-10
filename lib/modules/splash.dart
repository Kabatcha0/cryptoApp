import 'package:crypto/components/components.dart';
import 'package:crypto/layout/layout.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 270,
                height: 270,
                child: Image.asset(
                  "assets/image/1.gif",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "The Future",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Learn more about cryptocurrency. look to the future in iO Crypto",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              // const Expanded(child: SizedBox()),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  navigatorPushReplacement(
                      context: context, widget: const LayoutScreen());
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "CREATE PROTFOLIO",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          EvaIcons.diagonalArrowRightUpOutline,
                          color: Colors.white,
                          size: 24,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
