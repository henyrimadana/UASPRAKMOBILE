import 'package:flutter/material.dart';
import 'package:tgs_pemrograman_mobile/widgets/image_container.dart';

// import '../models/article_model.dart';
import '../widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Map;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article["urlToImage"],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadline(article: article),
            _NewsBody(article: article)
          ],
        ),

      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    super.key,
    required this.article,
  });

  final Map article;

  @override
  Widget build(BuildContext context) {

    String ubahdate (String date){
      String dateTimeString = date;
      // Ambil tahun, bulan, dan tanggal menggunakan slicing character
      String year = dateTimeString.substring(0, 4);
      String month = dateTimeString.substring(5, 7);
      String day = dateTimeString.substring(8, 10);

      return "$year-$month-$day";
    }

    String ubahAuthor(String author) {
      String originalString = author;

      // Membagi string menjadi kata-kata
      List<String> words = originalString.split(' ');

      // Mengambil dua kata pertama
      String firstTwoWords = words.length >= 2 ? '${words[0]} ${words[1]}' : originalString;

      // Tampilkan hasil
      return firstTwoWords;
    }


    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)
        ),
        color: Colors.white,
      ),
      child: Column(children: [
        Row(
          children: [
            CustomTag(backgroundColor: Colors.black,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                      article["urlToImage"] ?? ""
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  ubahAuthor(article["author"] ?? "") ,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,),
                ),
              ],
            ),
        const SizedBox(width: 10),
        CustomTag(backgroundColor: Colors.grey.shade200,
          children: [
            const Icon(
              Icons.timer,
              color: Colors.grey
            ),
            const SizedBox(width: 10),
            Text(
                 ubahdate(article["publishedAt"] ?? ""),
                style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
            const SizedBox(width: 10),
            CustomTag(backgroundColor: Colors.grey.shade200,
              children: [
                const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey
                ),
                const SizedBox(width: 10),
                
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          article["title"] ?? "",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          article["content"] ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(height: 1.5),
        ),
        const SizedBox(height: 200),



      ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    super.key,
    required this.article,
  });

  final Map article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15,
          ),
        CustomTag(
          backgroundColor: Colors.grey.withAlpha(150),
          children: [
            
          ],
        ),
        const SizedBox(height: 10),
        Text(
          article["title"] ?? "",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          article["description"] ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white,
          ),
        ),
      ],
      ),
    );
  }
}
