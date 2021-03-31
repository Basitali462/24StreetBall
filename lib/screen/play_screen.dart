import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint){
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: MediaQuery.of(context).size.height/3,
            child: Image(
              image: AssetImage(
                'assets/images/basket.png',
              ),
            ),
          ),
        ],
      );
    });
  }
}
