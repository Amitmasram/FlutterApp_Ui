// ignore_for_file: public_member_api_docs, sort_constructors_first
class Jewelry {

  int id;
  String carrot;
  String jewelryType;
  double pricePerHour;
  String image;
  Jewelry({
    required this.id,
    required this.carrot,
    required this.jewelryType,
    required this.pricePerHour,
    required this.image,
  });
}

List<Jewelry> jewelryList = [
  Jewelry(id: 1, 
  carrot: '7',
   jewelryType: 'Diamond Ring', 
   pricePerHour: 125, 
   image: 'assets/ring.png'),
   Jewelry(id: 2, 
  carrot: '9',
   jewelryType: 'Diamond Neckless', 
   pricePerHour: 155, 
   image: 'assets/neckless.png')

];
