import 'package:flutter/material.dart';
import 'package:tgs_pemrograman_mobile/models/article_model.dart';
import 'package:tgs_pemrograman_mobile/screens/article_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/discover_screen.dart';
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
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Langkah 3
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 215, 219, 226),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 35.0,
                    backgroundImage: AssetImage('assets/images/news.png'),
                  ),
                  SizedBox(height: 15),
                  Text("News Apps"),
                  Text("find the latest news here"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text("All News"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Categories"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiscoverScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(Icons.cancel),
              // trailing: Icon(Icons.cancel),
              title: Text("Back"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
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
                'Breaking News',
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
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset('assets/images/Frame 12.png',
                // height: 200, color: Colors.grey[700]),
                SizedBox(height: 2),
                // Text(
                //   "Welcome to the Home Page, ${username}!",
                //   style: GoogleFonts.montserrat(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 10),
                Text(
                  "We hope you see an amazing news here! ",
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    super.key,
    required this.article,
    // required this.articles,
  });

  final List article;

  get index => null;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        imageUrl: article[0]["urlToImage"] ?? "",
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTag(
                backgroundColor: Colors.grey.withAlpha(150),
                children: [
                  Text(
                    'News of the Day',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                article[0]["title"] ?? "",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ArticleScreen.routeName,
                    arguments: article[index],
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Learn More',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ]));
  }
}
