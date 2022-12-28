import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/provider/detail_movie_provider.dart';
import 'package:flutter_movie_app/data/service/detail_service.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<DetailProvider>(context, listen: false).getDetail(widget.id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Movie by ${widget.id}"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: DetailService().getDetail(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    
                    Text(snapshot.data!.overview),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("Errir");
              }
              return const Text("Josong");
            },
          )
        ],
      ),
    );
  }
}
