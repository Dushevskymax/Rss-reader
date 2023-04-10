// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:rss_reader/services/news_model.dart';
import 'package:rss_reader/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)!.settings.arguments as Map;
    List<NewsModel> news = data['news'];

    return Scaffold(
          appBar: AppBar(
            title: Container(
              child: TextField(
                controller:  searchController,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  hintText: "Link",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onSubmitted: (string) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Loading(url: string,)));
                },
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return news.length > 0 &&
                     news[0].newsTitle == 'no inet connection' ? 
                     const Text('No internet connection') : Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListTile(
                  tileColor: const Color.fromARGB(204, 43, 159, 255),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromRGBO(0x17, 0x25, 0x2a, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/webview', arguments: {
                      'url': news[index].newsUrl,
                    });
                  },
                  title: Text(news[index].newsTitle,
                      style: const TextStyle(
                          fontSize: 20,
                          )
                         ),
                  subtitle: Text(
                    news[index].newsPubDate,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ));

  }
}
