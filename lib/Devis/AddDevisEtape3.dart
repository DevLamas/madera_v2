import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Commercial.dart';
import '../Devis/AddDevis.dart';
import '../Devis/AddDevisEtape2.dart';
import '../Devis/AddDevisEtape4.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddDevisEtape3 extends StatefulWidget {
  @override
  _AddDevisEtape3 createState() => _AddDevisEtape3();
}

class _AddDevisEtape3 extends State<AddDevisEtape3> {

  String dropdownValueSection = "Section1";
  String nomModule = '';

  List listSection = ["Section1", "Section2", "Section3", "Section4", "Section5"];



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
                  'Création de devis : Etape 3 - Créations modules',
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
                  setState(() => nomModule = val);
                },
                decoration: InputDecoration(
                  hintText: 'Nom du module',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                ),
              ),

              //Liste déroulante pour les projet
              DropdownButton(
                hint: Text('Sélectionnez une section'),
                value: dropdownValueSection ,
                onChanged: (newValueSection){
                  setState(() {
                    dropdownValueSection  = newValueSection;
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
                items: listSection.map((valueItemSection) {
                  return DropdownMenuItem(
                    value: valueItemSection,
                    child: Text(valueItemSection),
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
                            MaterialPageRoute(builder: (context) => AddDevisEtape2()),
                          );

                        }
                    ),
                    RaisedButton(
                        color: Colors.blue[800],
                        child: Text(
                          'Continuer',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //print(email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddDevisEtape4()),
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