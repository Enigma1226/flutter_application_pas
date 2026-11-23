import 'package:get/get.dart';
import '../models/makanan_model.dart';

class ListMakananController extends GetxController {
  var makananList = <MakananModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMakanan();
  }

  void loadMakanan() {
    makananList.value = [
      MakananModel(
        nama: 'Nasi Goreng Spesial',
        harga: 25000,
        deskripsi:
            'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
        gambar:
            "https://awsimages.detik.net.id/community/media/visual/2022/11/25/resep-nasi-goreng-seafood_43.jpeg?w=600&q=90",
      ),
      MakananModel(
        nama: 'Ayam Bakar Madu',
        harga: 30000,
        deskripsi:
            'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
        gambar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrXzoixd4X-QZ9VM7IgykDWOiGt_uI-h6-DWEimUrJLw&s=10",
      ),
      MakananModel(
        nama: 'Sate Ayam Madura',
        harga: 28000,
        deskripsi:
            '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
        gambar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHXwKw6VJUzaJ4h7Ge8l-pI0IuNM7ldrsF1Bqwaworkw&s=10",
      ),
      MakananModel(
        nama: 'Mie Ayam Bakso',
        harga: 20000,
        deskripsi:
            'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
        gambar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0Nwy9f3_BASZPv_VphngKEFDzrb4GYj1I3IMTMrU4fg&s=10",
      ),
      MakananModel(
        nama: 'Es Teh Manis Jumbo',
        harga: 8000,
        deskripsi:
            'Minuman teh melati segar dengan gula asli dan es batu kristal.',
        gambar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3iZf4wFLAcZLjdfHlrBMHIX3XdKgGfM8sddnOYIUkZw&s=10",
      ),
    ];
  }
}
