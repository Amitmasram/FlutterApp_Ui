class BMMessageModel{

  String image;
  String name;
  String? message;
  bool? isActive;
  String? lastSeen;

  BMMessageModel({required this.image,this.message,required this.name,this.isActive,this.lastSeen});

}