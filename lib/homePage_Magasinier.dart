import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'login.dart';
import 'FamilleComposant/addFamilleComposant.dart';
import 'Composant/listComposant.dart';
import 'Composant/addComposant.dart';
import 'Fournisseur/listFournisseur.dart';
import 'Gamme/addGamme.dart';


class HomePageMagasinier extends StatefulWidget {
  @override
  _HomePageMagasinier createState() => _HomePageMagasinier();
}
class _HomePageMagasinier extends State<HomePageMagasinier> {

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
            child: Column (
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Nouvelle Famille',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddFamilleComposant()),
                        );
                      }
                  ),

                  RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Nouvelle Gamme',
                        style: TextStyle(color: Colors.white),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddGamme()),
                        );
                      }
                  ),



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

                  RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Liste Composant',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListeComposant()),
                        );
                      }
                  ),

                  RaisedButton(
                      color: Colors.blue[800],
                      child: Text(
                        'Liste Fournisseur',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListeFournisseur()),
                        );
                      }
                  ),
                ],
              ),
              ],
            ),
          ),
      );



      //Partie Windows
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
            IconButton(
              icon: Icon(Icons.wifi),
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            OutlineButton(
              child: Text(
                'Déconnexion',
                style: TextStyle(color: Colors.white),
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

        //Partie Corps de la page

        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  color: Colors.blue[800],
                  child: Text(
                    'Nouvelle Famille',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFamilleComposant()),
                    );
                  }
              ),

              RaisedButton(
                  color: Colors.blue[800],
                  child: Text(
                    'Nouvelle Gamme',
                    style: TextStyle(color: Colors.white),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddGamme()),
                    );
                  }
              ),


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



              RaisedButton(
                  color: Colors.blue[800],
                  child: Text(
                    'Liste Composant',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListeComposant()),
                    );
                  }
              ),
            ],

          ),

        ),
      );
    }


  }


}