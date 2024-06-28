import 'package:advance_flutter_exam/controller/api_provider.dart';
import 'package:advance_flutter_exam/controller/liked_provider.dart';
import 'package:advance_flutter_exam/screens/detail/liked_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../model/data_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProviderTrue = Provider.of<ApiProvider>(
        context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'Jokes App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.more_vert,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: apiProviderTrue.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff21262D),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30, horizontal: 15),
                  child: Text(
                    apiProviderTrue.data!.value.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        ShareExtend.share(
                            apiProviderTrue.data!.value.toString(),
                            'text');
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                    IconButton(onPressed: () {
                      Provider.of<LikedProvider>(context).toggleLike(
                          apiProviderTrue.data!);
                    }, icon: Provider.of<LikedProvider>(context).isLike
                        ? const Icon(Icons.favorite_border_outlined)
                        : const Icon(Icons.favorite),
                      color: Provider.of<LikedProvider>(context).isLike
                          ? Colors.red
                          : Colors.white,
                    ),
                    // Consumer<LikedProvider>(
                    //   builder: (context, likedProvider, child) {
                    //     return IconButton(
                    //       onPressed: () {
                    //         likedProvider.toggleLike(apiProviderTrue.data! as Data);
                    //       },
                    //       icon: likedProvider.isLiked(apiProviderTrue.data! as Data)
                    //           ? const Icon(Icons.favorite)
                    //           : const Icon(Icons.favorite_border_outlined),
                    //       color: likedProvider.isLiked(apiProviderTrue.data! as Data)
                    //           ? Colors.red
                    //           : Colors.white,
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LikedScreen(),),);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
