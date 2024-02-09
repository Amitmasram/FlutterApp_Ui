// ignore_for_file: file_names

import 'package:bloc_practice/bloc/apibloc.dart';
import 'package:bloc_practice/bloc/apistate.dart';
import 'package:bloc_practice/components/MyCard.dart';
import 'package:bloc_practice/components/searchbar.dart';
import 'package:bloc_practice/model/findbyIngredientsModel.dart';
import 'package:bloc_practice/model/recipemodel.dart';
import 'package:bloc_practice/utils/appColors.dart';
import 'package:bloc_practice/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          /*Custom Sroll View is used for animated screen like you can see the card in recipeDetail screen
            in app the app bar goes up as it scroll down. all because of the customscrollview widget.
            it has silvers. before using this make sure you read silvers first.*/
          const SliverAppBar(
              backgroundColor: backgroundColor,
              expandedHeight: 80.0,
              floating: false,
              pinned: true,
              elevation: 0,
              flexibleSpace: Center(
                child: MySearchBar(),
              )),
              // used nested bloc builder so handling multiple bloc on single screen
          BlocBuilder<FindByIngredientsBloc, FindRecipeState>(
            builder: (context, state) {
              if (state.data.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      findByIngredients usedIngredients = state.data[index];
                      return MyCard(
                        missedIngredientCount:
                            state.data[index].missedIngredientCount.toString(),
                        usedIngredientCount:
                            state.data[index].usedIngredientCount.toString(),
                        title: usedIngredients.title.toString(),
                        imageUrl: usedIngredients.image.toString(),
                        id: usedIngredients.id,
                      ).animate().then(duration: 1.seconds).flip();
                    },
                    childCount: state.data.length,
                  ),
                );
              } else {
                return BlocBuilder<ApiBloc, GetAPIState>(
                  builder: (context, state) {
                    RecipeModel? recipe;
                    if (state.data.isNotEmpty) {
                      recipe = state.data[0];
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: MyText.heading(text: 'NO DATA',color: blackColor),
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (state.data.isEmpty || recipe == null) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: secondaryColor,
                              ),
                            );
                          } else {
                            Results recipeDetails = recipe.results![index];
                            return MyCard(
                              missedIngredientCount: '',
                              usedIngredientCount: '',
                              title: recipeDetails.title.toString(),
                              imageUrl: recipeDetails.image.toString(),
                              id: recipeDetails.id,
                            ).animate().then(duration: 1.seconds).flip();
                          }
                        },
                        childCount: recipe.results?.length ?? 0,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
