import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/service/detail_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Movie ${widget.id}"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: DetailService().getDetail(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return SizedBox(
                  height: 100,
                  width: 100,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(snapshot.data!.originalTitle),
                          Text(snapshot.data!.overview),
                        ],
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text("Error");
              }
              return const Center(
                child: Text("Something Wrong"),
              );
            },
          )
        ],
      ),
    );
  }
}
