import 'package:filmler_uygulamasi_flutter/Filmler.dart';
import 'package:filmler_uygulamasi_flutter/Kategoriler.dart';
import 'package:filmler_uygulamasi_flutter/Yonetmenler.dart';
import '../VeritabaniYardimcisi.dart';



class FilmlerDao{



  // ignore: non_constant_identifier_names
  Future<List<Filmler>> tumFilmlerByKategori_Id(int kategori_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM filmler, kategoriler, yonetmenler "
            "WHERE filmler.kategori_id = kategoriler.kategori_id "
            "AND filmler.yonetmen_id = yonetmenler.yonetmen_id "
            "AND filmler.kategori_id = $kategori_id");


    return List.generate(maps.length, (index) {

      var row = maps[index];

      var k = Kategoriler(row["kategori_id"], row["kategori_ad"]);
      var y = Yonetmenler(row["yonetmen_id"], row["yonetmen_ad"]);
      var f = Filmler(row["film_id"], row["film_ad"], row["film_yil"], row["film_resim"], k, y);


      return f;

    }
    );
  }






}