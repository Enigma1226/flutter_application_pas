import 'package:flutter/material.dart';
import '../components/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header gradient
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    text: "Muhammad 'Illiyyin Syam Aldero",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const CustomText(
                      text: 'XI PPLG 2 / 27',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Info cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.person_outline,
                    title: 'Nama Lengkap',
                    subtitle: "Muhammad 'Illiyyin Syam Aldero",
                  ),
                  _buildInfoCard(
                    icon: Icons.class_outlined,
                    title: 'Kelas / No. Absen',
                    subtitle: 'XI PPLG 2 / 27',
                  ),
                  _buildInfoCard(
                    icon: Icons.school_outlined,
                    title: 'Jurusan',
                    subtitle:
                        'PPLG',
                  ),
                  _buildInfoCard(
                    icon: Icons.info_outline,
                    title: 'Bio Singkat',
                    subtitle:
                        'Seorang siswa yg merintis dari 0',
                  ),
                  const SizedBox(height: 12),

                  // Skill chips
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.code, color: Colors.indigo),
                              SizedBox(width: 12),
                              CustomText(
                                text: 'Keahlian',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildChip('Web'),
                              _buildChip('Game Dev'),
                              _buildChip('IoT'),
                              _buildChip('Mobile App'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.indigo),
        ),
        title: CustomText(
          text: title,
          fontSize: 13,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: CustomText(
            text: subtitle,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.indigo.shade50,
      labelStyle: const TextStyle(
        color: Colors.indigo,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.indigo.shade100),
      ),
    );
  }
}
