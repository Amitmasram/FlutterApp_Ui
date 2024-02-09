// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_practice/model/findbyIngredientsModel.dart';
import 'package:bloc_practice/model/getrecipeModel.dart';
import 'package:bloc_practice/model/recipemodel.dart';

import 'apievent.dart';
import 'apistate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_practice/netwrok/apiresponse.dart';

/*  handling Api using bloc and changes diffrent states by different events.
    some events also has state so it get the value from ui and take it to the bloc
    state is changed accordingly*/

class ApiBloc extends Bloc<ApiEvent, GetAPIState> {
  ApiResponse apiresponse = ApiResponse();

  ApiBloc() : super(const GetAPIState()) {
    on<GetApiEvent>(getapi);
  }

  void getapi(GetApiEvent event, Emitter<ApiState> states) async {
    List<RecipeModel> data = await apiresponse.getresponse(
        query: event.query); // getting api and initalizing the response
    emit(state.copyWith(data: data));
  }
}

class RecipeBloc extends Bloc<ApiEvent, GetRecipeState> {
  ApiResponse apiresponse = ApiResponse();

  RecipeBloc() : super(const GetRecipeState()) {
    on<GetRecipeEvent>(getRecipe);
  }

  void getRecipe(GetRecipeEvent event, Emitter<GetRecipeState> states) async {
    List<GetRecipeModel> data = await apiresponse.getRecipeApiResponse(
        id: event.id); // getting api and initalizing the response
    emit(state.copyWith(data: data));
  }
}

class FindByIngredientsBloc extends Bloc<ApiEvent, FindRecipeState> {
  ApiResponse apiresponse = ApiResponse();

  FindByIngredientsBloc() : super(const FindRecipeState()) {
    on<FindRecipeEvent>(getRecipe);
    on<ClearEvent>(cleardata);
  }

  void getRecipe(FindRecipeEvent event, Emitter<FindRecipeState> states) async {
    List<findByIngredients> data = await apiresponse.getresponsefromingredients(
        query: event.data); // getting api and initalizing the response
    emit(state.copywith(data: data));
  }

  void cleardata(ClearEvent event, Emitter<FindRecipeState> states) {
    emit(state.copywith(data: []));
  }
}
