import 'package:arijephyto/components/dataLists.dart';
import 'package:arijephyto/components/lists.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/models/produitCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class CategorieScreen extends StatefulWidget{
  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context).settings.arguments as int;
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColorTitle,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    )
                  ),
                  title: Text(
                  categoriesName[i],
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                  ),
            ),

            body: new ListView.builder(
              itemCount: matrixList[i].length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Padding(padding: EdgeInsets.only(bottom: 15), child : ProduitCard(matrixList[i][index]));
              }
            ),
            bottomNavigationBar: BottomNavyBarMeth(-1),
    )
    ,
  );
  }
}