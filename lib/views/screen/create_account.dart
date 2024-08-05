import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 800,
              width: 500,
              color: Colors.black,
            ),
            Container(
              height: 500,
              width: 500,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
