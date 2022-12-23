class TextPrice {

  late String text;
  late double value;

  TextPrice({required this.text, required this.value});

  TextPrice.fromMap(Map<String, dynamic> map){
    this.text = map['text'] ;
    this.value = map['value'] ;
  }

  Map<String , dynamic> toMap(){
    Map<String, dynamic> map={
      "text" : this.text,
      "value" : this.value,
    };
    return map;
  }

}