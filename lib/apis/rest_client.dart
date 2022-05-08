import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8080/")
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/login")
  Future<String> login(@Body() User user);

}

@JsonSerializable()
class User {
  String username;
  String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}