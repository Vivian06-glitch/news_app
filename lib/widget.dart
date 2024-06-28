import 'package:flutter/material.dart';

import 'model.dart';

class NewCard extends StatelessWidget {
  final List<Article> news;

  const NewCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(news[index].urlToImage ?? ""),
                   Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(news[index].title??"")
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [Text(news[index].description ?? "")],
                      )),
                ],
              ));
        });
  }
}
