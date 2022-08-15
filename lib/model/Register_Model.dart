class RegisterModel
{
  late String name;
  late String email;
  late String uId;
  late String phone;

  RegisterModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,

  });

  RegisterModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'email' : email,
        'uId' : uId,
        'phone' : phone,
      };
  }
}