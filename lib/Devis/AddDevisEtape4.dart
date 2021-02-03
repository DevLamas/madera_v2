import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Commercial.dart';
import '../Devis/AddDevis.dart';
import '../Devis/AddDevisEtape2.dart';
import '../Devis/AddDevisEtape3.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddDevisEtape4 extends StatefulWidget {
  @override
  _AddDevisEtape4 createState() => _AddDevisEtape4();
}

class _AddDevisEtape4 extends State<AddDevisEtape4> {




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
              icon: Icon(Icons.file_copy),
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDevis()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageCommercial()),
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
                  'Création de devis : Etape 4 Synthèse - Créations modules',
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
                color: Colors.green,
                  child: Text(
                    'Export PDF',
                    style: TextStyle(color: Colors.white),
                  ),
                  /*
                  onPressed: () {
                    //Partie sauvegarde des données
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageCommercial()),
                    );

                  }*/
              ),

              Text(
                'Synthèse en cours de travaux (problème du au niveau des requetes sql et de la partie back end inachevé'
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
                            MaterialPageRoute(builder: (context) => HomePageCommercial()),
                          );

                        }
                    ),
                    RaisedButton(
                        child: Text(
                          'Retour',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        onPressed: () {
                          //Partie sauvegarde des données
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddDevisEtape3()),
                          );

                        }
                    ),
                    RaisedButton(
                        color: Colors.blue[800],
                        child: Text(
                          'Sauvegarder',
                          style: TextStyle(color: Colors.white),
                        ),

                        onPressed: () {
                          //print(email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePageCommercial()),
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
    }


  }

}