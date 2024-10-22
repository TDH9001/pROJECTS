import 'package:database_sqllite/main.dart';
import 'package:database_sqllite/models/articleModels.dart';
import 'package:database_sqllite/services/newsservice.dart';
import 'package:database_sqllite/stolenWidgests/news_list_view.dart';
import 'package:database_sqllite/widgets/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import "package:database_sqllite/services/newsservice.dart";

//6d6bfb6954b04753bd81583fa3c5e3cd   API KEY

class news extends StatelessWidget {
  news({super.key, required this.am});

  List<ArticleModel> am;
  List<String> l = [
    "business",
    "entertaiment",
    "general",
    "health",
    "science",
    "sports"
    // "technology"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const SizedBox(
            width: double.infinity,
            height: 40,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News ",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: upperList(l: l)),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(childCount: am.length,
            //       (context, index) {
            //     test(index);
            //   }),
            // ),
            fb(),
            SliverToBoxAdapter(child: randomButton())
          ],
        ),
      ),
    );
  }

  // Widget test(int index) {
  //   if (am[index].image != null &&
  //       am[index].subTitle != null &&
  //       am[index].title != null) {
  //     return NewsTile(
  //       articleModel: am[index],
  //     );
  //   } else {
  //     return SizedBox(width: 0);
  //   }
  // }

  Widget fb() {
    return FutureBuilder(
        future: Newsservice(Dio()).getNews(),
        builder: (context, snapshot) {
          return NewsListView(articles: snapshot.data ?? []);
        });
  }
}

class LowerList extends StatelessWidget {
  LowerList({super.key, required this.am});
  List<ArticleModel> am;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: am.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              width: 70,
              height: 200,
              color: Colors.yellow,
              child: Column(
                children: [
                  Image.network(
                    am[index].image ?? "NullFile",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    am[index].title ??
                        "no data found somehow for a title...useless api",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class upperList extends StatelessWidget {
  const upperList({
    super.key,
    required this.l,
  });

  final List<String> l;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 120,
        // color: Colors.pink,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: l.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/news/${l[index]}.avif"))),
                  child: Center(
                    child: Text(
                      l[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

Widget randomButton() {
  return MaterialButton(
      onPressed: () async {
        List<ArticleModel> artLsit = await Newsservice(Dio()).getNews();
      },
      color: Colors.green,
      child: Text("try using the thingy  from dio"));
}

Widget fb() {
  return FutureBuilder(
      future: Newsservice(Dio()).getNews(),
      builder: (context, snapshot) {
        return NewsListView(
          articles: snapshot.data ?? [],
        );
      });
}
