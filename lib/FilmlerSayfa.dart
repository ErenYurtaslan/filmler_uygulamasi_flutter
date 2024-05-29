import 'package:filmler_uygulamasi_flutter/Dao/FilmlerDao.dart';
import 'package:filmler_uygulamasi_flutter/DetaySayfa.dart';
import 'package:filmler_uygulamasi_flutter/Filmler.dart';
import 'package:filmler_uygulamasi_flutter/Kategoriler.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class FilmlerSayfa extends StatefulWidget {

Kategoriler kategori;


FilmlerSayfa({super.key, required this.kategori});

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  Future<List<Filmler>> filmleriGoster(int kategori_id) async{
    var filmlerListesi = await FilmlerDao().tumFilmlerByKategori_Id(kategori_id);

    return filmlerListesi;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(




      appBar: AppBar(
        title: Text("Filmler: ${widget.kategori.kategori_ad}"),
      ),





      body: FutureBuilder<List<Filmler>>(
          future: filmleriGoster(widget.kategori.kategori_id),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var filmlerListesi = snapshot.data;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:  4/7,),
                itemCount: filmlerListesi!.length,
                itemBuilder: (context, index){
                  var film = filmlerListesi[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Detay(film: film,)));
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("images/${film.film_resim}"),
                          ),
                          Text(film.film_ad, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold ),),
                        ],
                      ),
                    ),
                  );
                },

              );
            }else{
              return const Center();
            }
          }
      ),






    );
  }
}
