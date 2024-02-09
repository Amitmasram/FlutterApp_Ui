// ignore_for_file: file_names

/*  a model class can be created easily by just copy the api response.
    go to any website that converts json to dart paste the response.
    the model class will be created but sometime there will be issues in generated code while handling the
    complex API. */

class GetRecipeModel {
  String? name;
  List<Steps>? steps;

  GetRecipeModel({this.name, this.steps});

  GetRecipeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  List<Equipment>? equipment;
  List<Ingredients>? ingredients;
  int? number;
  String? step;
  Temperature? length;

  Steps(
      {this.equipment, this.ingredients, this.number, this.step, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    if (json['equipment'] != null) {
      equipment = <Equipment>[];
      json['equipment'].forEach((v) {
        equipment!.add(Equipment.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    number = json['number'];
    step = json['step'];
    length = json['length'] != null
        ? Temperature.fromJson(json['length'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (equipment != null) {
      data['equipment'] = equipment!.map((v) => v.toJson()).toList();
    }
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    data['number'] = number;
    data['step'] = step;
    if (length != null) {
      data['length'] = length!.toJson();
    }
    return data;
  }
}

class Equipment {
  int? id;
  String? image;
  String? name;
  Temperature? temperature;

  Equipment({this.id, this.image, this.name, this.temperature});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    temperature = json['temperature'] != null
        ? Temperature.fromJson(json['temperature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    if (temperature != null) {
      data['temperature'] = temperature!.toJson();
    }
    return data;
  }
}

class Temperature {
  int? number;
  String? unit;

  Temperature({this.number, this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['unit'] = unit;
    return data;
  }
}

class Ingredients {
  int? id;
  String? image;
  String? name;

  Ingredients({this.id, this.image, this.name});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}
