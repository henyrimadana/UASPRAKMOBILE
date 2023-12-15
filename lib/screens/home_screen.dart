import 'package:flutter/material.dart';
import 'package:tgs_pemrograman_mobile/models/article_model.dart';
import 'package:tgs_pemrograman_mobile/screens/article_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/discover_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/profile.dart';
import 'package:tgs_pemrograman_mobile/screens/settings.dart';
import 'package:tgs_pemrograman_mobile/services/fetchapi.dart';
import 'package:tgs_pemrograman_mobile/widgets/custom_tag.dart';
import 'package:tgs_pemrograman_mobile/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiDatas fetchapi = new ApiDatas();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String? username = ModalRoute.of(context)?.settings.arguments as String?;
    Article article = Article.articles[0];

    if (username == null) {
      username = 'Guest';
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: fetchapi.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return ListView(padding: EdgeInsets.zero, children: [
              _NewsOfTheDay(article: snapshot.data!["articles"]),
              _BreakingNews(
                articles: snapshot.data!["articles"],
                username: username!,
              ),

              SizedBox(height: 20), // Spasi sebelum teks tambahan
              Container(
                color: Colors.teal, // Background warna teal
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: Text(
                    'Halo, $username. This is Headlines News Today',
                    textAlign: TextAlign.center, // Rata tengah
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white), // Teks besar dan warna putih
                  ),
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    required this.articles,
    required this.username,
    super.key,
  });

  final List articles;
  final String username;

  String ubahdate(String date) {
    String dateTimeString = date;

    // Ambil tahun, bulan, dan tanggal menggunakan slicing character
    String year = dateTimeString.substring(0, 4);
    String month = dateTimeString.substring(5, 7);
    String day = dateTimeString.substring(8, 10);
    String time = dateTimeString.substring(11, 16); // Ambil jam (HH:mm)

    return "$year-$month-$day ($time)";
  }

  String ubahAuthor(String author) {
    String originalString = author;

    // Membagi string menjadi kata-kata
    List<String> words = originalString.split(' ');

    // Mengambil dua kata pertama
    String firstTwoWords =
        words.length >= 2 ? '${words[0]} ${words[1]}' : originalString;

    // Tampilkan hasil
    return firstTwoWords;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Giga News Today',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              // Text('More', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                if (articles[index]["urlToImage"] == null ||
                    articles[index]["content"] == null) {
                  return Container();
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ArticleScreen.routeName,
                          arguments: articles[index],
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5,
                            imageUrl: articles[index]["urlToImage"] ?? "",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            articles[index]["title"] ?? "",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          const SizedBox(height: 5),
                          Text(
                              "at ${ubahdate(articles[index]["publishedAt"] ?? "")}",
                              style: Theme.of(context).textTheme.bodySmall!),
                          const SizedBox(height: 5),
                          Text(
                              "by ${ubahAuthor(articles[index]["author"] ?? "")}",
                              style: Theme.of(context).textTheme.bodySmall!),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final List article;

  get index => null;

  @override
  Widget build(BuildContext context) {
    String? imageUrl = '';

    // Cari artikel pertama yang memiliki gambar
    for (var article in article) {
      if (article["urlToImage"] != null && article["title"] != null) {
        imageUrl = article["urlToImage"];
        break;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article[0]["urlToImage"] ?? ""),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          article[0]["title"] ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleScreen.routeName,
                            arguments: article[0],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.teal),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Read More',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.teal,
                                    ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_right_alt,
                                color: Colors.teal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
