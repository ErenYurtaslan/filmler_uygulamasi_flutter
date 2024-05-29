import 'package:filmler_uygulamasi_flutter/Filmler.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detay extends StatefulWidget {

  Filmler film;


  Detay({super.key, required this.film});

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.film.film_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/${widget.film.film_resim}"),
            Text(widget.film.yonetmen.yonetmen_ad, style: const TextStyle(fontSize: 31, fontWeight: FontWeight.bold ),),
            Text(widget.film.film_yil.toString(), style: const TextStyle(fontSize: 31, fontWeight: FontWeight.bold ),),
          ],
        ),
      ),
    );
  }
}
