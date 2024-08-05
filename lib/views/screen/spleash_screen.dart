import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_memories/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        timer.cancel();
      },
    );
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 900,
              width: 500,
              color: Color(0xfffdcd45),
              child: Align(
                  alignment: Alignment(0.1, -0.75),
                  child: Text(
                    "Store Memories",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  )),
            ),
            Center(
              child: Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26,
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/logo/logo.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Wellcome.....",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// //   (AuthHepler.authHepler.firebaseAuth.currentUser != null)
//         //       ? MyRoutes.home
//         //       : MyRoutes.lets,
//         // );
