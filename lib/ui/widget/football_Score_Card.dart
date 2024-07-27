import 'package:first_firebase_connection/entities/football.dart';
import 'package:flutter/material.dart';

class FootballScoreCard extends StatelessWidget {
  const FootballScoreCard({
    super.key, required this.football,
  });
  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMatchInfo(),
            const SizedBox(height: 16),
            _buildTeamRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Football Match',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        const Icon(
          Icons.sports_soccer,
          color: Colors.blueGrey,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildTeamRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTeam(football.team1Name, football.team1Score, Colors.blueAccent),
        const Text(
          'vs',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        _buildTeam(football.team2Name, football.team2Score, Colors.redAccent),
      ],
    );
  }

  Widget _buildTeam(String teamName, int score, Color color) {
    return Column(
      children: [
        Text(
          score.toString(),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
