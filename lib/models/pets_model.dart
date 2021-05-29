class PetsModel {
  String image;
  String name;
  String gender;
  String age;
  String petType;
  String price;
  String type;
  String distance;

  PetsModel({
    this.image,
    this.name,
    this.gender,
    this.petType,
    this.price,
    this.age,
    this.type,
    this.distance,
  });

  PetsModel.fromJson(Map<String, dynamic> map) {
    // if (map == null) {
    //   return;
    // }
    image = map['image'];
    name = map['name'];
    gender = map['gender'];
    age = map['age'];
    petType = map['animal_type'];
    price = map['price'];
    type = map['type'];
    distance = map['distance'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'gender': gender,
      'animal_type': petType,
      'age': age,
      'price': price,
      'type': type,
      'distance': distance,
    };
  }
}