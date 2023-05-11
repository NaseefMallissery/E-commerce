class TokenModel {
  final String accessToken;
  final String refreshToken;
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });


  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
