import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/detail_movie_provider.dart';
import 'package:flutter_movie_app/utils/result_state.dart';
import 'package:flutter_movie_app/utils/styles.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProvider>(context, listen: false).getDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<DetailProvider>(
            builder: (context, DetailProvider valueProvider, _) {
          if (valueProvider.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (valueProvider.state == ResultState.hasData) {
            return Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                        "https://image.tmdb.org/t/p/original/${valueProvider.detailModel!.backdropPath}"),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(color: primaryColor),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(valueProvider.detailModel?.originalTitle ?? "Kosong"),
              ],
            );
          } else if (valueProvider.state == ResultState.noData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cannot load Data"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kembali ke beranda"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        }),
      ),
    );
  }

// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Movie ${widget.id}"),
//       ),
//       body: Column(
//         children: [
//           FutureBuilder(
//             future: DetailService().getDetail(widget.id),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasData) {
//                 return SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           Text(snapshot.data!.originalTitle),
//                           Text(snapshot.data!.overview),
//                         ],
//                       );
//                     },
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return const Text("Error");
//               }
//               return const Center(
//                 child: Text("Something Wrong"),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
}
