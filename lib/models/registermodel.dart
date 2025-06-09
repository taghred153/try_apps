class RegisterModel{
  bool status;
  String message;
  RegisterModel({required this.status, required this.message});
  factory RegisterModel.fromjaon(Map<String, dynamic> json){
    return RegisterModel(status: json["status"], message: json["message"]);
  }
}