import 'package:arijephyto/components/classElement.dart';
import 'package:arijephyto/components/logicFunctions.dart';
import 'package:arijephyto/screens/panier/panier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class ProduitCard extends StatefulWidget {
  final Produit produit;
  ProduitCard(this.produit);
  @override 
  _ProduitCardState createState() => _ProduitCardState();
}

class _ProduitCardState extends State<ProduitCard>{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Color(0xFFF5F5F5),
        child: InkWell(
          splashColor: Color(0xFFF5F5FF),
          onTap: () {
            widget.produit.prodNombre = 1;
            Navigator.pushNamed(context, '/produit', arguments: widget.produit);
          },
          child: Container(
            width: width * 0.8,
            child: Padding( 
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        child: Container(
                          width: width * 0.25, 
                          height: height * 0.15,
                          child: Image.asset(widget.produit.prodImage, )
                          ),
                        ),
    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Container(
                            width: width * 0.35,
                            child: Text(
                              widget.produit.prodTitle,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: kTextColorTitle, 
                                    fontSize: kTextSizeTitle
                                )
                                ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                        widget.produit.prodPrix.toString()+'0 Dh',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.normal, 
                              color: kTextColorTitle, 
                              fontSize: kTextSize
                          )
                          ),
                      ),
                        
                      ],
                    ),
                    ],
                  ),
                  Container(
                    width: width * 0.6,
                    child: MaterialButton(
                          child: Text('AJOUTER AU PANIER',
                                  style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                                ),
                          onPressed: () {
                            setState(() {
                              if(getProduit(Panier.listProduitsPanier, widget.produit.idProduit) == null){
                                Panier.listProduitsPanier.insert(0, widget.produit);
                                Panier.somme = calculeSommePanier(Panier.listProduitsPanier);
                              }
                            });
                            Navigator.popAndPushNamed(context, '/panier');
                          },
                          color: Color(0xFF6C8DAB),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
 }
}