import 'dart:async';

import 'package:advance_flutter_exam/controller/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ApiProvider apiProviderTrue = Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: apiProviderTrue.isLoading
          ? const Center(child: CircularProgressIndicator(),)
          : Center(
            child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(apiProviderTrue.data!.icon.toString(),fit: BoxFit.cover,),
                  ),
          ),
    );
  }
}
