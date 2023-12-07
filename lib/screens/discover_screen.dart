import 'package:flutter/material.dart';
import 'package:tgs_pemrograman_mobile/screens/article_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/home_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/login_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/settings.dart';
import 'package:tgs_pemrograman_mobile/services/fetchapi.dart';
import 'package:tgs_pemrograman_mobile/widgets/image_container.dart';

// import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      "Business",
      "Entertainment",
      "General",
      "Health",
      "Science",
      "Sport",
      "Technology"
    ];

    int selectedIndex = 0;

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(index: 1),
        body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)]),
      ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  State<_CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<_CategoryNews> {
//---API Fetch Section----//

  //---API Fetch Section----//
  Map data = {};
  ApiDatas fetchapi = new ApiDatas();

  void setupData(String category) async {
    Map response = await fetchapi.getDataByCategory(category);
    if (response.isEmpty) {
      print("Something error");
    } else {
      print("Data Fetch Success");
      setState(() {
        data = response;
      });
    }
  }

  @override
  void initState() {
    // Memanggil dengan kategori pertama sebagai nilai default
    setupData(widget.tabs[0].toLowerCase());
    super.initState();
  }

  String ubahdate(String date) {
    String dateTimeString = date;

    // Ambil tahun, bulan, dan tanggal menggunakan slicing character
    String year = dateTimeString.substring(0, 4);
    String month = dateTimeString.substring(5, 7);
    String day = dateTimeString.substring(8, 10);
    String time = dateTimeString.substring(11, 16); // Ambil jam (HH:mm)

    return "$year-$month-$day ($time)";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: widget.tabs
                .map(
                  (tab) => Tab(
                    icon: Text(
                      tab,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                .toList()),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: widget.tabs
                  .map(
                    (tab) => FutureBuilder(
                      future: fetchapi.getDataByCategory(tab.toLowerCase()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        } else {
                          final articles = snapshot.data!["articles"];
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  setupData(tab);
                                  Navigator.pushNamed(
                                    context,
                                    ArticleScreen.routeName,
                                    arguments: articles[index],
                                  );
                                },
                                child: Row(
                                  children: [
                                    ImageContainer(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.all(10.0),
                                      borderRadius: 5,
                                      imageUrl:
                                          articles[index]["urlToImage"] ?? "",
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            articles[index]["title"] ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.schedule,
                                                size: 18,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                ubahdate(articles[index]
                                                        ["publishedAt"] ??
                                                    ""),
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(width: 20),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        }
                      },
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text('News from all over the world',
              style: Theme.of(context).textTheme.bodySmall!),
        ],
      ),
    );
  }
}
