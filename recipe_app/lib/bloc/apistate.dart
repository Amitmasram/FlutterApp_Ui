import 'package:bloc_practice/model/findbyIngredientsModel.dart';
import 'package:bloc_practice/model/getrecipeModel.dart';
import 'package:bloc_practice/model/recipemodel.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object?> get props => [];
}

class GetAPIState extends ApiState {
  final List<RecipeModel> data;

  const GetAPIState({this.data = const []});

  // a method which will be used for changing state
  GetAPIState copyWith({List<RecipeModel>? data}) {
    return GetAPIState(data: data ?? []);
  }

  @override
  List<Object?> get props => [data];
}

class GetRecipeState extends ApiState {
  final List<GetRecipeModel> data;

  const GetRecipeState({this.data = const []});

  // a method which will be used for changing state
  GetRecipeState copyWith({List<GetRecipeModel>? data}) {
    return GetRecipeState(data: data ?? []);
  }

  @override
  List<Object?> get props => [data];
}

class FindRecipeState extends ApiState {
  final List<findByIngredients> data;

  const FindRecipeState({this.data = const []});

  FindRecipeState copywith({List<findByIngredients>? data}) {
    return FindRecipeState(data: data ?? []);
  }

  @override
  List<Object> get props => [data];
}
