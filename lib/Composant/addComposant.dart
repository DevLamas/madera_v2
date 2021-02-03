import 'package:flutter/material.dart';
import 'dart:io';
import '../login.dart';
import '../homePage_Magasinier.dart';


class AddComposant extends StatefulWidget {
  @override
  _AddComposant createState() => _AddComposant();
}

class _AddComposant extends State<AddComposant> {

  String designation = '';
  String caracteristique = '';
  String quantite = '';
  String prix = '';

  String dropdownValueFournisseur = "Fournisseur ELANCH";
  String dropdownValueFamilleComposant = "Famille1";

  List listFournisseur = ["Fournisseur ELANCH", "Strapp", "CoupeDure", "FabChantier"];
  List listFamilleComposant = ["Famille1", "Famille2", "Famille3", "Famille4"];

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
                    'Création du nouveau composant',
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
                  value: dropdownValueFournisseur ,
                  onChanged: (newValueFournisseur){
                    setState(() {
                      dropdownValueFournisseur  = newValueFournisseur;
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
                  items: listFournisseur.map((valueItemFournisseur) {
                    return DropdownMenuItem(
                      value: valueItemFournisseur,
                      child: Text(valueItemFournisseur),
                    );
                  }).toList(),
                ),


                DropdownButton(
                  hint: Text('Sélectionnez un modèle de gamme'),
                  value: dropdownValueFamilleComposant,
                  onChanged: (newValueFC){
                    setState(() {
                      dropdownValueFamilleComposant = newValueFC;
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
                  items: listFamilleComposant.map((valueItemFC) {
                    return DropdownMenuItem(
                      value: valueItemFC,
                      child: Text(valueItemFC),
                    );
                  }).toList(),
                ),





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
                    hintText: '',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
                SizedBox(height: 20.0),

                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Caractéristique : ',
                    style: TextStyle(
                      color: Colors.blue[800],
                    ),),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => caracteristique = val);
                  },
                  decoration: InputDecoration(
                    hintText: '',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
                SizedBox(height: 20.0),


                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Quantité : ',
                    style: TextStyle(
                      color: Colors.blue[800],
                    ),),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => quantite = val);
                  },
                  decoration: InputDecoration(
                    hintText: 'ex : quentin.dop@gmail.com',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
                SizedBox(height: 20.0),


                Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'Prix : ',
                    style: TextStyle(
                      color: Colors.blue[800],
                    ),),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => prix = val);
                  },
                  decoration: InputDecoration(
                    hintText: 'ex : 0214547896',
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