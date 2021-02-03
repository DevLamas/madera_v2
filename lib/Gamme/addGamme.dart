import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Magasinier.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddGamme extends StatefulWidget {
  @override
  _AddGamme createState() => _AddGamme();
}

class _AddGamme extends State<AddGamme> {

  String dropdownValueComposant = "Vis 55 mmm";
  String designation = '';

  List listComposants = ["Vis 55 mmm", "Planche en bois de hetre", "Poutre métalique 30*20 cm", "Clou perforant acier 5 mm", "Bloc de platre dimmension 130*200*10 cm"];



  @override
  Widget build(BuildContext context) {
    //Vérification que la plateforme soit linux ou windows (possibiliter de le configurer avec IOS)
    if (Platform.isAndroid) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Acceuil Commercial',
            style: TextStyle(color: Colors.blue[800]),
          ),
          //Icon wifi activé/désactivé
          leading: IconButton(
            icon: Icon(Icons.wifi),
            color: Colors.blue[800],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          //actions des différents icones
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },

            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 200.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Création de la nouvelle gamme',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //Input Mot de passe (Mis non visible immédiat

              TextFormField(
                onChanged: (val) {
                  setState(() => designation = val);
                },
                decoration: InputDecoration(
                  hintText: 'Désignation',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                ),
              ),

              //Liste déroulante pour les projet
              DropdownButton(
                hint: Text('Sélectionnez un ou des composants'),
                value: dropdownValueComposant ,
                onChanged: (newValueComposant){
                  setState(() {
                    dropdownValueComposant  = newValueComposant;
                  });
                },
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                dropdownColor: Colors.white,
                underline: SizedBox(),
                style: TextStyle(
                  color: Colors.black,
                ),
                items: listComposants.map((valueItemComposant) {
                  return DropdownMenuItem(
                    value: valueItemComposant,
                    child: Text(valueItemComposant),
                  );
                }).toList(),
              ),





              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        child: Text(
                          'Annuler',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        onPressed: () {
                          //Partie sauvegarde des données
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePageMagasinier()),
                          );

                        }
                    ),
                    RaisedButton(
                        color: Colors.blue[800],
                        child: Text(
                          'Enregister',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //print(email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePageMagasinier()),
                          );

                        }
                    ),
                  ]
              ),

            ],

          ),
        ),
      );


    } else if (Platform.isWindows){
      /*
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Acceuil Commercial',
            style: TextStyle(color: Colors.blue[800]),
          ),
          leading: Text('a gauche'),
          actions: [
            Image(
              image: AssetImage('images/wifi.png'),
            ),
            OutlineButton(
              child: Text(
                'Déconnexion',
                style: TextStyle(color: Colors.blue[800]),
              ),
              color: Colors.blue[800],
              onPressed: () async {
                print("Déconnecter, l'utilisateur retournera à la page d'acceuil");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        ),
      );
    */}


  }

}