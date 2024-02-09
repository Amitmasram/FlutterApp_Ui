import 'package:bloc_practice/model/findbyIngredientsModel.dart';
import 'package:bloc_practice/model/getrecipeModel.dart';
import 'package:bloc_practice/model/recipemodel.dart';
import 'package:bloc_practice/netwrok/api_service.dart';
import 'package:bloc_practice/netwrok/urls.dart';
import 'package:flutter/foundation.dart';

class ApiResponse {
  ApiService api = ApiService();

  getresponse({String? query}) async {
    try {
      List<RecipeModel> recipes =
          await api.getApi(Urls.search, query: query);
      return recipes;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getresponsefromingredients({String? query}) async {
    try {
      List<findByIngredients> recipes =
          await api.getApiIngredients(Urls.searchbyingredients, query: query);
      return recipes;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getRecipeApiResponse({int? id})async{
    try {
      List<GetRecipeModel> recipe = await api.getRecipe(Urls.getRecipeurl(id));
      return recipe;
    } catch (e) {
      if(kDebugMode){
        print(e);
      }
    }
  }
}
