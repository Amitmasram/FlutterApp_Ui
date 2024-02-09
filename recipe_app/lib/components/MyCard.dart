// ignore_for_file: file_names

import 'package:bloc_practice/bloc/apibloc.dart';
import 'package:bloc_practice/bloc/apievent.dart';
import 'package:bloc_practice/components/Elevatedbutton.dart';
import 'package:bloc_practice/utils/Navigation.dart';
import 'package:bloc_practice/utils/appColors.dart';
import 'package:bloc_practice/utils/styles.dart';
import 'package:bloc_practice/utils/textStyle.dart';
import 'package:bloc_practice/view/RecipeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int? id;
  final String? usedIngredientCount;
  final String? missedIngredientCount;

  const MyCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.id,
      this.missedIngredientCount,
      this.usedIngredientCount});

  @override
  Widget build(BuildContext context) {
    return Styles.container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Styles.plate(imageUrl: imageUrl, height: 300, width: 300),
            SizedBox(
              width: 300,
              child: MyText.heading(text: title),
            ),
            usedIngredientCount == '' && missedIngredientCount == ''
                ? Container()
                : MyText.body(
                  color: whiteColor,
                    text:
                        'Item Used: $usedIngredientCount Missed Items: $missedIngredientCount'),
            MyButton(
              ontap: () {
                context.read<RecipeBloc>().add(GetRecipeEvent(id: id!));
                Navigation.to(
                    context,
                    RecipeScreen(
                      imageUrl: imageUrl,
                      title: title,
                    ));
              },
              title: 'Get Recipe',
            ).animate().then(delay: 1.5.seconds).fadeIn(begin: 0)
          ],
        ));
  }
}
