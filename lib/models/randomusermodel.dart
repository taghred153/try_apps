class RandomUserModel{
  List<Map<String, dynamic>> results;
  RandomUserModel({required this.results});
  factory RandomUserModel.fromjson(Map<String, dynamic> json){
    return RandomUserModel(
    results: List<Map<String, dynamic>>.from(json["results"])
    );
  }
}