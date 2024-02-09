class Urls {
  static String baseUrl = 'https://api.spoonacular.com/recipes';
  static String search = '$baseUrl/complexSearch';
  static String searchbyingredients = '$baseUrl/findByIngredients';

  static getRecipeurl(int? id){
    return '$baseUrl/$id/analyzedInstructions';
  }

}
