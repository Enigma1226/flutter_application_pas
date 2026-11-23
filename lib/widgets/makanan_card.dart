import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/makanan_model.dart';
import '../routes.dart';
import '../components/custom_text.dart';

class MakananCard extends StatelessWidget {
  final MakananModel makanan;

  const MakananCard({super.key, required this.makanan});

  String formatRupiah(int angka) {
    String hasil = angka.toString();
    String formatted = '';
    int count = 0;
    for (int i = hasil.length - 1; i >= 0; i--) {
      count++;
      formatted = hasil[i] + formatted;
      if (count % 3 == 0 && i != 0) {
        formatted = '.$formatted';
      }
    }
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Get.toNamed(Routes.detail_makanan, arguments: makanan);
        },
        child: Row(
          children: [
            // Gambar makanan
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                makanan.gambar,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => const SizedBox(
                  width: 110,
                  height: 110,
                  child: Center(child: Icon(Icons.fastfood, size: 50)),
                ),
              ),
            ),
            // Info makanan
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: makanan.nama,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      text: formatRupiah(makanan.harga),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
