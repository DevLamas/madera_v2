import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Magasinier.dart';
import 'addComposant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class ListeComposant extends StatefulWidget {
  @override
  _ListeComposant createState() => _ListeComposant();
}

class _ListeComposant extends State<ListeComposant> {

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
            'Acceuil Magasinier',
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
              icon: Icon(Icons.home),
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageMagasinier()),
                );
              },
            ),
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
                  'Liste des composants',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              RaisedButton(
                  color: Colors.blue[800],
                  child: Text(
                    'Nouveau Composant',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddComposant()),
                    );
                  }
              ),
              SizedBox(height: 20.0),

              Table(
                children: [
                  TableRow(children: [
                    Text('Modifier'),
                    Text('Nature'),
                    Text('Caractéristique'),
                    Text("Unité d'usage"),
                  ]),
                  TableRow(children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddComposant()),
                        );
                      },
                    ),
                    Text('Contrefort'),
                    Text('20.2cm'),
                    Text("20cm"),
                  ]),

                  TableRow(children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddComposant()),
                        );
                      },
                    ),
                    Text('Contrefort'),
                    Text('20.2cm'),
                    Text("20cm"),
                  ]),

                  TableRow(children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddComposant()),
                        );
                      },
                    ),
                    Text("Panneaux d'isolation"),
                    Text('20.2cm'),
                    Text("20cm"),
                  ]),
                ]
              )


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