import 'package:advance_flutter_exam/controller/liked_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likedProvider = Provider.of<LikedProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Liked Jokes',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: likedProvider.likedJokes.length,
        itemBuilder: (context, index) {
          final joke = likedProvider.likedJokes[index];
          return ListTile(
            title: Text(
              joke.value.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            tileColor: const Color(0xff21262D),
          );
        },
      ),
    );
  }
}
