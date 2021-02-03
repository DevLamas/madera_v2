import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Commercial.dart';
import '../Devis/AddDevisEtape2.dart';
import '../Client/AddClient.dart';


class AddDevis extends StatefulWidget {
  @override
  _AddDevis createState() => _AddDevis();
}

class _AddDevis extends State<AddDevis> {

  String dropdownValueClient = "DAMON François";
  String dropdownValueProjet = "RE2215712";
  String nomDevis = '';
  //String password = '';
  List listClient = ["DAMON François", "DURAND Marie", "EDOUARD Jack"];
  List listProject = ["RE2215712", "RE2216542", "RE9995712", "RE9005412"];
  DateTime _date;


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
                  'Création de devis : Etape 1 - Information chantier/projet',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              TextFormField(
                /*onChanged: (val) {
                  setState(() => nomDevis = val);
                },*/
                decoration: InputDecoration(
                  hintText: 'Nom du devis',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                ),
              ),

              //Espacement Entre le Input Mail et Password
              SizedBox(height: 20.0),
              //Input Mot de passe (Mis non visible immédiat

              //Liste déroulante pour les projet
              DropdownButton(
                hint: Text('Sélectionnez un projet'),
                value: dropdownValueProjet,
                onChanged: (newValue){
                  setState(() {
                    dropdownValueProjet = newValue;
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
                items: listProject.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),

              //boutton ajout si besoin
              RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Nouveau Projet?',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageCommercial()),
                    );
                  }
              ),

              DropdownButton(
                hint: Text('Sélectionnez un client'),
                value: dropdownValueClient,
                onChanged: (newValueClient){
                  setState(() {
                    dropdownValueClient = newValueClient;
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
                items: listClient.map((valueItemClient) {
                  return DropdownMenuItem(
                    value: valueItemClient,
                    child: Text(valueItemClient),
                  );
                }).toList(),
              ),

              RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Nouveau Client?',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddClient()),
                    );
                  }
              ),


              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Colors.blue[800],
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _date == null ? DateTime.now() : _date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2040),
                      ).then((date){
                        setState(() {
                          _date = date;
                        });
                      });
                    },

                  ),
                  Text(_date == null ? 'Sélectionner une date' : _date.toString()),
                ],

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
                        color: Colors.blue[800],
                        child: Text(
                          'Continuer',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //print(email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddDevisEtape2()),
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