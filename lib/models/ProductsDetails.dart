class ProDetails{

  late String name;
  late int id;
  late String description;

  ProDetails({
    required this.name,
    required this.id,
    required this.description,
  });

  ProDetails.fromMap(Map<String, dynamic> map) {

    this.id = map['id'];
    this.name = map['categoryName'];
    this.description = map['description'].toString();

  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map={
      "id" : this.id ,
      "name" : this.name,
      "description" : this.description,
    };
    return map;
  }

}