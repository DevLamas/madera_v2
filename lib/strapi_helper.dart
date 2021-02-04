import 'dart:convert';

import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api  {

  Strapi _strapiClient;

  Api(login,password){
    Initialize(login,password);
  }

 Strapi getApi(){
    return _strapiClient;
  }

  static Future<Strapi> Initialize(login, password) async {

    final strapiClient = Strapi.newClient();
    print('login en cours');
    final token = await strapiClient.http.post('http://telougat.space:1337/auth/local',  data: {'identifier': login, 'password': password});
    print(token);

  }
}