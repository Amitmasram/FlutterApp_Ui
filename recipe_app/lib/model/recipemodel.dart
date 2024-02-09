class RecipeModel {
  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;

  RecipeModel({this.results, this.offset, this.number, this.totalResults});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['offset'] = offset;
    data['number'] = number;
    data['totalResults'] = totalResults;
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Results({this.id, this.title, this.image, this.imageType});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['imageType'] = imageType;
    return data;
  }
}