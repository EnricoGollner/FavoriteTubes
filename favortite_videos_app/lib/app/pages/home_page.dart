import 'package:favortite_videos_app/delegates/data_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          child: Image.asset("assets/youtube_logo.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          const Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () async {
              String? result =
                  await showSearch(context: context, delegate: DataSearch());
              print(result ?? '');
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(),
    );
  }
}
