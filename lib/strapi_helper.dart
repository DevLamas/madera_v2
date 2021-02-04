import 'dart:convert';

import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api  {

  Strapi _strapiClient;

  Api(){
    Initialize();
  }

 Strapi getApi(){
    return _strapiClient;
  }

  static Future<Strapi> Initialize() async {

    final strapiClient = Strapi.newClient();
    final token = await strapiClient.http.post('https://telougat.space:1337/auth/local',  data: {'identifier': 'Timothé', 'password': 'Azerty123'});
    print(token);
    return strapiClient;

  }
}