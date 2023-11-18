import 'package:flutter/cupertino.dart';

import 'package:imageview360/imageview360.dart';

class Kart350 extends StatelessWidget {
  const Kart350({super.key});

  @override
  Widget build(BuildContext context) {
    List<ImageProvider> imageList = [];
    for (int i = 1; i <= 9; i++) {
      imageList.add(AssetImage('assets/images/kart-$i.png'));
    }
    return SizedBox(
      height: 275,
      child: ImageView360(
        key: UniqueKey(),
        //autoRotate: true,
        imageList: imageList,
      ),
    );
  }
}
