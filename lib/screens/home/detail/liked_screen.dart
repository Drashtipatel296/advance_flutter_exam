// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../controller/api_provider.dart';
//
// class LikedScreen extends StatelessWidget {
//   const LikedScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ApiProvider apiProviderTrue =
//         Provider.of<ApiProvider>(context, listen: true);
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: apiProviderTrue.isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 height: 400,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(apiProviderTrue.data.value.),
//               ),
//             ),
//     );
//   }
// }
