import 'package:flutter/material.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Text('705 shop'),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
