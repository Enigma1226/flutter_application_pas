import 'package:flutter/material.dart';
import '../models/team_model.dart';
import '../components/custom_text.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Logo klub
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                team.strBadge,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) => const SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                      child: Icon(Icons.sports_soccer, size: 40)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Info tim
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: team.strTeam,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.stadium,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CustomText(
                          text: team.strStadium,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
