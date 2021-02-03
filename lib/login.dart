import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'homePage_Commercial.dart';
import 'homePage_Magasinier.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  String email = '';
  String password = '';
/*
  Partie connexion, il va rechercher sur Strapi si il y a dans la collection utilisateur un Utilisateur en fonction de l'email et du mot de passe
  Si il y : Cela génerera une session entrant le nom, le prénom et le statut de l'tutilisateur
  Future login(email, password) async{

      var data  = await http.get("http://localhost:1337/utilisateurs/");
      var jsonData = json.decode(data.body);
      if (jsonData != null){

      }
          //headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
          //{'name':utilisateur.firstName,'email':utilisateur.email,'password':utilisateur.password});
    //Navigator.push(context, new MaterialPageRoute(builder: (context)=>Home(1,0)));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('SIGN IN Project MADERA'),
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 200, left: 200),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200.0),
              Text(
                'MADERA',
                style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 20.0),
              //Input
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Connexion',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                ),
              ),

              //Espacement Entre le Input Mail et Password
              SizedBox(height: 20.0),

              //Input Mot de passe (Mis non visible immédiat
              TextFormField( 
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),

                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blue[800],
                  child: Text(
                    'Connexion',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(email);
                    print(password);
                    //redirige vers la partie authentification
                    //login(email, password);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageCommercial()),
                    );

                  }
              ),
              //Espacement
                //Bouton mot de passe oublié
                FlatButton(
                  child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue[800]),
                ),
                onPressed: () async {
                  print("Une alerte a été envoyé, regardez votre boite mail pour le chnagement de votre mot de passe!");
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }


}