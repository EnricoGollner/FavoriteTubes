import 'dart:convert';

import 'package:favortite_videos_app/app/data/http/http_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  // Widgets/Botoes que fica a direita na SearchBar (retorna lista de Widgets que serao posicionados)
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          // LIMPAR PESQUISA
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Widgets que ficarao a esquerda quando a bar estiver em focus

    return IconButton(
      onPressed: () {
        // Sair da search
        close(context, "");
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation, // gerenciado pela própria tela de search
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder<List>(
      future: sugestions(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data![index]),
              leading: const Icon(Icons.play_arrow),
              onTap: () {
                query = snapshot.data![index];
              },
            );
          },
        );
      },
    );
  }

  Future<List> sugestions(String search) async {
    final client = HttpClient();

    http.Response response = await client.get(
      url:
          "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json",
    );

    if (response.statusCode == 200) {
      return json
          .decode(response.body)[1]
          .map(
            (value) => value[0],
          )
          .toList();
    } else {
      throw Exception("Failed to load sugestions");
    }
  }
}
