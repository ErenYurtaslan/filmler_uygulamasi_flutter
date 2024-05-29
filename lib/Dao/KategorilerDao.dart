import 'package:filmler_uygulamasi_flutter/Kategoriler.dart';
import 'package:filmler_uygulamasi_flutter/VeritabaniYardimcisi.dart';

class KategorilerDao{

  Future<List<Kategoriler>> tumKategoriler() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (index) {

      var row = maps[index];

      return Kategoriler(row["kategori_id"], row["kategori_ad"]);

      }
    );
  }
}