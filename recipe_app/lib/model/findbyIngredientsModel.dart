// ignore_for_file: camel_case_types, file_names

class findByIngredients {
  int? id;
  String? image;
  String? imageType;
  int? likes;
  int? missedIngredientCount;
  List<Ingredient>? missedIngredients;
  String? title;
  List<Ingredient>? unusedIngredients;
  int? usedIngredientCount;
  List<Ingredient>? usedIngredients;

  findByIngredients({
    this.id,
    this.image,
    this.imageType,
    this.likes,
    this.missedIngredientCount,
    this.missedIngredients,
    this.title,
    this.unusedIngredients,
    this.usedIngredientCount,
    this.usedIngredients,
  });

  findByIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    imageType = json['imageType'];
    likes = json['likes'];
    missedIngredientCount = json['missedIngredientCount'];
    title = json['title'];
    usedIngredientCount = json['usedIngredientCount'];
    /*  getting the list comming from api.
        as json['missedIngredients'] is List of map<String,dynamic>.
        so Ingredients model class is created for this which contains the same variables as Map keys from Api.*/
    if (json['missedIngredients'] != null) {
      missedIngredients = <Ingredient>[];
      json['missedIngredients'].forEach((v) {
        missedIngredients!.add(Ingredient.fromJson(v));
      });
    }
    if (json['unusedIngredients'] != null) {
      unusedIngredients = <Ingredient>[];
      json['unusedIngredients'].forEach((v) {
        unusedIngredients!.add(Ingredient.fromJson(v));
      });
    }
    if (json['usedIngredients'] != null) {
      usedIngredients = <Ingredient>[];
      json['usedIngredients'].forEach((v) {
        usedIngredients!.add(Ingredient.fromJson(v));
      });
    }
  }
}

class Ingredient {
  String? aisle;
  double? amount;
  int? id;
  String? image;
  List<String>? meta;
  String? name;
  String? original;
  String? originalName;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? extendedName;

  Ingredient(
      {this.aisle,
      this.amount,
      this.id,
      this.image,
      this.meta,
      this.name,
      this.original,
      this.originalName,
      this.unit,
      this.unitLong,
      this.unitShort,
      this.extendedName});

  Ingredient.fromJson(Map<String, dynamic> json) {
        aisle= json['aisle'];
        amount= json['amount'].toDouble();
        id= json['id'];
        image= json['image'];
        /* json[meta] returns List of string so no need to create a model class for it as
            it is List Type. model class could be created if the Type is map<String,dynamic>*/
        if(json['meta'] != null){
          meta = <String>[];
          json['meta'].forEach((v){
            meta!.add(v);
          });
        }
        name= json['name'];
        original= json['original'];
        originalName= json['originalName'];
        unit= json['unit'];
        unitLong= json['unitLong'];
        unitShort= json['unitShort'];
        extendedName= json['extendedName'];
  }
}
