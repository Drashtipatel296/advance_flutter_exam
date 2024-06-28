import 'package:advance_flutter_exam/controller/api_provider.dart';
import 'package:advance_flutter_exam/controller/liked_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProviderTrue = Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.menu,color: Colors.white,),
        title: const Text(
          'Jokes App',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
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
                    color: Color(0xff21262D),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 250,
                      //   width: 250,
                      //   // color: Colors.black,
                      //   child: Image.network(
                      //     apiProviderTrue.data!.icon.toString(),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Text(
                          apiProviderTrue.data!.value.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: () {
                            ShareExtend.share(apiProviderTrue.data!.value.toString(), 'text');
                          }, icon: Icon(Icons.share,color: Colors.white,),),
                          Icon(Icons.copy,color: Colors.white,),
                          IconButton(
                              onPressed: () {
                                Provider.of<LikedProvider>(context,listen: false).isLiked();
                              },
                              icon: Provider.of<LikedProvider>(context).isLike
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined),
                            color: Provider.of<LikedProvider>(context).isLike
                                ? Colors.red
                                : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {

        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
