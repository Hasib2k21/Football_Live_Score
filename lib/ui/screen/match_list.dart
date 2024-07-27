import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_firebase_connection/entities/football.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/football_Score_Card.dart';

class MatchList extends StatefulWidget {
  const MatchList({super.key});

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchlist = [];

  Future<void> _getFootballMatches() async {
    matchlist.clear();
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();

    for (QueryDocumentSnapshot doc in result.docs) {
      matchlist.add(
        Football(
          matchName: doc.id,
          team1Name: doc.get('team1Name'),
          team2Name: doc.get('team2Name'),
          team1Score: doc.get('team1'),
          team2Score: doc.get('team2'),
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getFootballMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FootballAppBar(),
      body: StreamBuilder(
          stream: firebaseFirestore.collection('football').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData == false) {
              return const Center(
                child: Text('Empty list'),
              );
            }
            matchlist.clear();
            for (QueryDocumentSnapshot doc in snapshot.data?.docs ?? []) {
              matchlist.add(
                Football(
                  matchName: doc.id,
                  team1Name: doc.get('team1Name'),
                  team2Name: doc.get('team2Name'),
                  team1Score: doc.get('team1'),
                  team2Score: doc.get('team2'),
                ),
              );
            }

            return ListView.builder(
              itemCount: matchlist.length,
              itemBuilder: (context, index) {
                return FootballScoreCard(
                  football: matchlist[index],
                );
              },
            );
          }),
    );
  }
}



