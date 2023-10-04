class UserRegisterModel{
  final String email;
  final String password;
  final String retryPassword;
  
  UserRegisterModel({
    required this.email,
    required this.password,
    required this.retryPassword
  });

  factory UserRegisterModel.fromJeson(Map<String, dynamic> json){
    return UserRegisterModel(
      email: json['email'],
      password: json['password'],
      retryPassword: json['retryPassword']
    );
  }
}