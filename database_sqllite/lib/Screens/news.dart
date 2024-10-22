import 'package:flutter/material.dart';

//6d6bfb6954b04753bd81583fa3c5e3cd   API KEY

class news extends StatelessWidget {
  news({super.key});

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
//            SliverToBoxAdapter(child: LowerList())
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 8, (context, index) {
                return const LowerList();
              }),
            )
          ],
        ),
        // body: Column(
        //   children: [upperList(l: l), lowerLsit()],
        // ),
      ),
    );
  }

  // lowerList() {
  //   return Container(
  //     width: double.infinity,
  //     height: 606,
  //     color: Colors.green,
  //     child: ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         itemCount: 9,
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemBuilder: (context, index) {
  //           return Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               padding: EdgeInsets.all(2.0),
  //               width: 70,
  //               height: 200,
  //               color: Colors.black,
  //             ),
  //           );
  //         }),
  //   );
  // }
}

class LowerList extends StatelessWidget {
  const LowerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              width: 70,
              height: 200,
              color: Colors.black,
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
