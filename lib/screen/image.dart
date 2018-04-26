
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var assetsImage = new AssetImage('assets/ic_account_circle.png');
    var image = new Image(image: assetsImage,width: 48.0, height: 48.0,);

    return new Container(child: image,);
  }
}