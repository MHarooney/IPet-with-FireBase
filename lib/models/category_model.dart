class PetsCategory {
  String image;
  String name;

  PetsCategory({
    this.image,
    this.name,
  });

  PetsCategory.fromJson(Map<String, dynamic> map) {
    // if (map == null) {
    //   return;
    // }
    image = map['image'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }
}