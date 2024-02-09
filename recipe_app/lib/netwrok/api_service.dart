import 'package:bloc_practice/model/findbyIngredientsModel.dart';
import 'package:bloc_practice/model/getrecipeModel.dart';
import 'package:bloc_practice/model/recipemodel.dart';
import 'package:bloc_practice/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/*An API Service class which has multiple apis for different return type*/


class ApiService {
  Dio dio = Dio();

  Future<List<RecipeModel>> getApi(String? url,
      {String? query}) async {
    try {
      Response res = await dio.get(url!,
          options: Options(headers: {"Content-Type": "application/json"}),
          queryParameters: {
            "apiKey": apiKey,
            "query": query,
          });
      if (res.statusCode == 200) {
        // Assuming RecipeModel.fromJson is designed to handle a Map<String, dynamic>
        List<Map<String, dynamic>> body = [res.data];
        List<RecipeModel> recipes =
            body.map((data) => RecipeModel.fromJson(data)).toList();
        return recipes;
      } else {
        if (kDebugMode) {
          print('error');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }

  Future<List<findByIngredients>> getApiIngredients(String? url,
      {String? query}) async {
    try {
      Response res = await dio.get(url!,
          options: Options(headers: {"Content-Type": "application/json"}),
          queryParameters: {
            "apiKey": apiKey,
            "ingredients": query,
          });
      if (res.statusCode == 200) {
        List<dynamic> body = res.data;
        List<findByIngredients> recipes =
            body.map((data) => findByIngredients.fromJson(data)).toList();
        return recipes;
      } else {
        if (kDebugMode) {
          print('error ${res.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }

  Future<List<GetRecipeModel>> getRecipe(String? url) async {
    try {
      Response res = await dio.get(url!,
          options: Options(headers: {"Content-Type": "application/json"}),
          queryParameters: {
            "apiKey": apiKey,
          });
      if (res.statusCode == 200) {
        List body = res.data;
        List<GetRecipeModel> recipes =
            body.map((data) => GetRecipeModel.fromJson(data)).toList();
        return recipes;
      } else {
        if (kDebugMode) {
          print('error');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }
}
