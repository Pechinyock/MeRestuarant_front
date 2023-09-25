class TokenModel{
  final String accessToken;
  final String refreshToken;
  
  TokenModel({
    required this.accessToken,
    required this.refreshToken
  });

  factory TokenModel.fromJeson(Map<String, dynamic> json){
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken']
    );
  }

  @override
  String toString() {    
    return 'access token: $accessToken \n refresh token: $refreshToken';
  }
}