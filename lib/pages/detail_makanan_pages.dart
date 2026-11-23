import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_makanan_controller.dart';
import '../components/custom_text.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';

class DetailMakananPage extends StatelessWidget {
  DetailMakananPage({super.key});

  final controller = Get.put(DetailMakananController());

  String formatRupiah(double angka) {
    String hasil = angka.toStringAsFixed(0);
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
    final makanan = controller.makanan;

    return Scaffold(
      appBar: AppBar(
        title: Text(makanan.nama),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar makanan
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                makanan.gambar,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => const SizedBox(
                  height: 220,
                  child: Center(child: Icon(Icons.fastfood, size: 50)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama makanan
            CustomText(
              text: makanan.nama,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            const SizedBox(height: 8),

            // Harga satuan
            CustomText(
              text: formatRupiah(makanan.harga.toDouble()),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.green.shade700,
            ),
            const SizedBox(height: 12),

            // Deskripsi
            CustomText(
              text: makanan.deskripsi,
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
            const SizedBox(height: 24),

            // Input jumlah
            const CustomText(
              text: 'Jumlah Pembelian:',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              myHint: 'Masukkan jumlah',
              txtController: controller.jumlahController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Tombol bayar
            CustomButton(
              text: 'Bayar',
              onPressed: () => controller.hitungPembayaran(),
              width: double.infinity,
              height: 50,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              borderRadius: 12,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Rincian pembayaran (reaktif)
            Obx(() {
              if (!controller.sudahDihitung.value) {
                return const SizedBox.shrink();
              }
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Rincian Pembayaran',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      const Divider(height: 24),
                      _buildRow(
                          'Subtotal', formatRupiah(controller.subtotal.value)),
                      const SizedBox(height: 8),
                      _buildRow('PPN (5%)', formatRupiah(controller.ppn.value)),
                      const Divider(height: 24),
                      _buildRow(
                        'Total Bayar',
                        formatRupiah(controller.totalBayar.value),
                        isBold: true,
                        color: Colors.green.shade700,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value,
      {bool isBold = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: label,
          fontSize: 15,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        CustomText(
          text: value,
          fontSize: 15,
          fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}