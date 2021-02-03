import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Commercial.dart';
import '../Devis/AddDevis.dart';
import '../Devis/AddDevisEtape3.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddDevisEtape2 extends StatefulWidget {
  @override
  _AddDevisEtape2 createState() => _AddDevisEtape2();
}

class _AddDevisEtape2 extends State<AddDevisEtape2> {

  String dropdownValueGamme = "Gamme1";
  String dropdownValueModeleGamme = "ModeleG1";
  String dropdownValueTypeRemplissage = "Type 1";
  String dropdownValueFinition = "Finition1";
  String dropdownValueSectionGroupe = "Section1";

  List listGamme = ["Gamme1", "Gamme2", "Gamme3"];
  List listModeleGamme = ["ModeleG1", "ModeleG2", "ModeleG3", "ModeleG4"];
  List listTypeRemplissage = ["Type 1", "Type 2", "Type 3"];
  List listFinition = ["Finition1", "Finition2", "Finition3", "Finition4"];
  List listSection = ["Section1", "Section2", "Section4", "Section5"];



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
                  'Création de devis : Etape 2 - Conception des produits',
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

              //Liste déroulante pour les projet
              DropdownButton(
                hint: Text('Sélectionnez une Gamme'),
                value: dropdownValueGamme ,
                onChanged: (newValueGamme){
                  setState(() {
                    dropdownValueGamme  = newValueGamme;
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
                items: listGamme.map((valueItemGamme) {
                  return DropdownMenuItem(
                    value: valueItemGamme,
                    child: Text(valueItemGamme),
                  );
                }).toList(),
              ),


              DropdownButton(
                hint: Text('Sélectionnez un modèle de gamme'),
                value: dropdownValueModeleGamme,
                onChanged: (newValueMG){
                  setState(() {
                    dropdownValueModeleGamme = newValueMG;
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
                items: listModeleGamme.map((valueItemMG) {
                  return DropdownMenuItem(
                    value: valueItemMG,
                    child: Text(valueItemMG),
                  );
                }).toList(),
              ),


              DropdownButton(
                hint: Text('Sélectionnez un Type de remplissage'),
                value: dropdownValueTypeRemplissage,
                onChanged: (newValueTR){
                  setState(() {
                    dropdownValueTypeRemplissage = newValueTR;
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
                items: listTypeRemplissage.map((valueItemTR) {
                  return DropdownMenuItem(
                    value: valueItemTR,
                    child: Text(valueItemTR),
                  );
                }).toList(),
              ),


              DropdownButton(
                hint: Text('Sélectionnez une Finition'),
                value: dropdownValueFinition,
                onChanged: (newValueF){
                  setState(() {
                    dropdownValueFinition = newValueF;
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
                items: listFinition.map((valueItemF) {
                  return DropdownMenuItem(
                    value: valueItemF,
                    child: Text(valueItemF),
                  );
                }).toList(),
              ),




              DropdownButton(
                hint: Text('Sélectionnez une coupe'),
                value: dropdownValueSectionGroupe,
                onChanged: (newValueClient){
                setState(() {
                    dropdownValueSectionGroupe = newValueClient;
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
                items: listSection.map((valueItemSect) {
                  return DropdownMenuItem(
                    value: valueItemSect,
                    child: Text(valueItemSect),
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
                            MaterialPageRoute(builder: (context) => AddDevis()),
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
                            MaterialPageRoute(builder: (context) => AddDevisEtape3()),
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