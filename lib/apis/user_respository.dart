import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/apis/rest_client.dart';

class UserRepository {
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    // await Future.delayed(Duration(seconds: 1));
    // return '${username}:${password}';

    final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
    String token = await client.login(User(username: username, password: password));
    return token;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
