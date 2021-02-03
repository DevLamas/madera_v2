import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Magasinier.dart';


class AddFamilleComposant extends StatefulWidget {
  @override
  _AddFamilleComposant createState() => _AddFamilleComposant();
}

class _AddFamilleComposant extends State<AddFamilleComposant> {

  String designation = '';


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
          padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 50.0),
          child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Création de la nouvelle famille de composant',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Désignation : ',
                    style: TextStyle(
                      color: Colors.blue[800],
                    ),),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => designation = val);
                  },
                  decoration: InputDecoration(
                    hintText: 'ex : DOP',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
                SizedBox(height: 20.0),

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
                            'Enregistrer',
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

              ]
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