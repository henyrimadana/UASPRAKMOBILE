import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  static List<Article> articles = [
    Article(
      id: '1',
      title:
          'Kaesang Kenakan Kaos Bergambar Prabowo Saat Bawa PSI ke Kertanegara',
      subtitle:
          'Ketua Umum Partai Solidaritas Indonesia Kaesang Pangarep bertandang ke kediaman Ketua Umum Partai Gerindra Prabowo Subianto di Kertanegara pada Kamis (12/10) sore.',
      body:
          'Kaesang mengatakan tidak ada yang asing dengan pilihannya mengenakan kaos bergambar Prabowo lantaran ia sudah sering mengenakannya. Karena itu ia membantah pengenaan kaos bergambar Prabowo itu berkaitan dengan preferensi politik PSI pada pemilihan presiden.'
          "Saya sudah sering pakai baju ini, waktu Pak Ketua Umum (Prabowo) jadi bintang tamu di podcast saya juga, saya pakai baju ini,"
          'kata Kaesang saat konferensi pers.Menurut Kaesang hingga kini PSI belum mengumumkan sikap resmi terkait pemilihan presiden. Ia menyebut partai berlambang mawar itu masih mempertimbangkan sejumlah hal sebelum memutuskan nama capres yang didukung.'
          "Ya kalau untuk bentuk dukungan, sabar, jawabannya sabar. Itu kan rahasia,"
          'kata Kaesang. Kaesang tak sendirian saat bertandang ke kediaman Prabowo. Ia berkunjung bersama Wakil Ketua Dewan Pembina PSI Grace Natalie, Anggota Dewan Pembina Giring Ganesha, Sekjen Raja Juli Antoni, dan sejumlah petinggi PSI lainnya.',
      author: 'Ade Rosman',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'Politics',
      views: 2212,
      imageUrl:
          'https://cdn1.katadata.co.id/media/images/thumb/2023/10/12/Kaesang_Pangareb_bawa_Partai_Solidaritas_Indonesia_bertemu_dengan_Prabowo_Subianto_Kamis_1210-2023_10_12-19_27_36_2264fedd8fd099d8bfa29cff34fc873c_960x640_thumb.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '2',
      title: 'Pemerintah Akan Pangkas Distribusi Demi Tekan Harga Elpiji 3 Kg',
      subtitle:
          'Pemerintah berencana untuk memangkas rantai suplai atau suplai chain pada distribusi elpiji 3 kilogram (kg) bersubsidi. Hal tersebut ditujukan untuk menekan harga elpiji melon di daerah.',
      body:
          'Menteri Koordinator Bidang Perekonomian, Airlangga Hartarto mengatakan tingginya harga eceran elpiji 3 kg di sejumlah daerah disebabkan oleh rantai distribusi yang panjang. Makin panjang alur distribusi, harga elpiji bersubsidi akan makin tinggi. Nantinya, penyaluran elpiji 3 kg bakal dipangkas mengikuti manajemen distribusi pupuk bersubsidi untuk petani. Alur distribusi pupuk bersubsidi pada umumnya berangkat dari produsen, gudang provinsi, gudang kabupaten dan kios sebagai tingkat pengecer.  "Menteri ESDM minta dievaluasi agar bisa diperpendek. Kalau dibandingkan industri pupuk, jalur distribusi elpiji 3 kg lebih panjang," kata Airlangga di Istana Merdeka Jakarta pada Kamis (12/10). Pada kesempatan yang sama, Menteri ESDM Arifin Tasrif menyampaikan telah ada rencana untuk mengubah model distribusi elpiji 3 kg melalui Keputusan Direktur Jenderal Minyak dan Gas Bumi (Kepdirjen) Kementerian ESDM Nomor 99.K/MG.05/DJM/2023. Aturan yang terbit pada 28 Februari 2023 itu mendorong masyarakat untuk segera mendaftarkan diri ke basis data subsiditepat.mypertamina.id untuk memperoleh akses pembelian elpiji 3 kilogram (kg) di agen atau pangkalan resmi.',
      author: 'Muhammad Fajar',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'Economy',
      views: 702,
      imageUrl:
          'https://cdn1.katadata.co.id/media/images/thumb/2023/08/10/2023_08_10-20_25_04_ca1df9d4-37e5-11ee-ae5d-13a4e8f0fc0e_960x640_thumb.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    Article(
      id: '3',
      title:
          'Mahfud MD Resmi Jadi Bakal Cawapres Ganjar Pranowo di Pilpres 2024',
      subtitle:
          'Dewan Pimpinan Pusat PDI Perjuangan (PDIP) mengumumkan Menteri Koordinator Bidang Politik, Hukum, dan Keamanan (Menko Polhukam) Mahfud MD sebagai bakal calon wakil presiden (cawapres) pendamping Ganjar Pranowo untuk Pilpres 2024.',
      body:
          'Pengumuman nama Mahfud MD disampaikan langsung Ketua Umum PDIP Megawati Soekarnoputri."Dengan mengucapkan Bismillahirrahmanirrahim, maka calon wakil presiden yang dipilih PDIP yang akan mendampingi Bapak Ganjar Pranowo adalah Bapak Mahfud MD," kata Megawati di kantor DPP PDIP, Menteng, Jakarta Pusat, Rabu (18/10).TPN Ungkap Cawapres Ganjar Berinisial M'
          'Sehari sebelumnya, Sekretaris Jenderal PDIP Hasto Kristiyanto hanya memberi kisi-kisi bahwa sosok cawapres Ganjar memiliki inisial M.Menurut Hasto, Megawati telah mencermati sosok cawapres Ganjar ini sejak lama. Dia menyebut pemilihan Mahfud sebagai cawapres merupakan hasil perenungan mendalam dan sesuai dengan tantangan yang dihadapi bangsa Indonesia saat ini.Mahfud saat ini menjabat sebagai Menko Polhukam di pemerintahan Presiden Joko Widodo. Adapun Ganjar kini didukung oleh koalisi PDIP, Hanura, PPP, dan Perindo.',
      author: 'Risal Hidayat',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'Politics',
      views: 3021,
      imageUrl:
          'https://akcdn.detik.net.id/visual/2023/10/18/mahfud-md-resmi-jadi-bakal-cawapres-ganjar-pranowo-8_169.jpeg?w=650&q=90',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Article(
      id: '4',
      title: 'Biden Murka soal RS Gaza Dibom saat Perang Hamas-Israel Panas',
      subtitle:
          'Presiden Amerika Serikat Joe Biden mengecam serangan di Rumah Sakit Baptis Al Ahli di Jalur Gaza Palestina pada Selasa (17/10).',
      body:
          '"Saya marah dan sangat sedih atas ledakan di rumah sakit Al Ahli Arab di Gaza, dan menyebabkan banyak korban jiwa," kata Biden di Israel, seperti dikutip Reuters.Presiden Palestina soal RS Gaza Dibom: Israel Sudah Kelewat BatasInsiden ini terjadi kala perang Israel vs Hamas terus memanas sejak 7 Oktober lalu. Biden pun melawat Israel untuk menunjukkan dukungan kepada Israel dan membantu meredam eskalasi.Biden mengatakan AS mengarahkan tim keamanan nasional untuk mengumpulkan informasi terkait insiden tersebut. Ia juga menegaskan Negeri Paman Sam mendukung perlindungan kehidupan warga sipil selama perang berkecamuk.Selain itu, Presiden AS ini menyampaikan duka cita untuk korban."Kami berduka atas para pasien, staf medis, dan orang tak berdosa lainnya yang tewas atau terluka dalam tragedi ini," ujar dia.Usai Roket Hantam RS, Israel Diduga Bombardir Toko Kue di Jalur GazaRS di Gaza itu hancur gegara serangan roket. Imbas serangan tersebut 500 orang termasuk anak-anak dan perempuan dilaporkan tewas.Hamas menuding Israel menjadi aktor dibalik serangan ini. Pemimpin Hamas Ismail Haniyeh bahkan menyalahkan AS atas insiden ini. Ia menuturkan AS kerap melindungi Israel sehingga Tel Aviv sehingga Israel berani menggempur Jalur Gaza',
      author: 'Budi Antoni',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'International',
      views: 973,
      imageUrl:
          'https://akcdn.detik.net.id/visual/2022/11/15/joe-biden-di-pembukaan-ktt-g20_169.jpeg?w=650&q=90',
      createdAt: DateTime.now().subtract(const Duration(hours: 19)),
    ),
    Article(
      id: '5',
      title:
          'Evakuasi KA Argo Semeru Anjlok di Wates Rampung, Jalur Bisa Dilalui',
      subtitle:
          'Proses evakuasi rangkaian KA Argo Semeru yang anjlok dan terserempet KA Argo Wilis di kilometer 520 +4 Petak Jalan Sentolo, Wates, Kulon Progo, telah selesai, Rabu (18/10).',
      body:
          '"Alhamdulillah tadi jam 09.56 WIB kereta yang anjlok, dari sembilan yang anjlok itu sudah selesai diangkut ditaruh lagi di atas rel," kata Direktur Utama PT Kereta Api Indonesia (Persero) Didiek Hartantyo di lokasi.Fakta-fakta Kereta Argo Semeru Anjlok dan Diserempet KA Argo WilisEvakuasi berhasil berkat kerjasama lintas instansi mulai dari TNI, Polri, Damkar, serta Ditjen Perkeretaapian dan PT KAI yang mengerahkan alat berat crane masing-masing.Didiek menyebut PT KAI selanjutnya segera menormalisasi jalur hulu dari arah Jakarta, sementara jalur hilir telah pulih dan sudah dipakai melintas KA Argo Lawu dari Solo Balapan tujuan Stasiun Gambir."Kemarin untuk menjalankan kereta api, terpaksa kereta kita putar. Jadi, arah Jakarta Bandung yang menuju Surabaya kita arahkan Cirebon ke Semarang turun ke arah Solo baru ke timur. Demikian juga dari Surabaya yang ke arah Bandung Jakarta, itu dari Surabaya, Madiun, Solo naik ke Semarang langsung ke Cirebon, Jakarta, Bandung," ujarnya.KA Argo Lawu yang berangkat pukul 11.33 WIB tadi jadi kereta pertama yang dialihkan dan melintasi jalur hilir dengan batas kecepatan maksimal 40 km/jam. Didiek mengatakan normalisasi jalur hulu diperkirakan memakan waktu dua jam. Ia menargetkan jalur tersebut bisa digunakan kembali hari ini."Dengan penyelesaian hari ini, normalisasi jalur hulu ini tadi udah diawali Argo Lawu, akan dilanjutkan kereta-kereta berikutnya. Para pelanggan penumpang yang memerlukan KA Bandara, Prameks ini segera kita normalkan kembali," ujarnya.Didiek mewakili seluruh jajaran direksi dan pegawai PT KAI memohon maaf sebesar-besarnya atas insiden anjloknya KA Argo Semeru yang terjadi kemarin."Kami bersama dengan direktur keselamatan dan KNKT akan melakukan investigasi penyebab daripada kejadian ini untuk kemudian diambil langkah-langkah secara governance," katanya.Sejauh ini PT KAI masih menyelidiki pemicu insiden ini. Adapun setelah kejadian para penumpang Argo Semeru langsung dievakuasi ke Stasiun Wates menggunakan KA Bandara YIA setelah kejadian sebelum melanjutkan perjalanannya ke tujuan. Sedangkan penumpang KA Argo Wilis diangkut ke Stasiun Tugu Yogyakarta.Insiden ini menyebakan puluhan penumpang mengalami luka-luka. Beberapa harus dilarikan dan dirawat di rumah sakit.',
      author: 'Reyhan Aditya',
      authorImageUrl:
          'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      category: 'Politics',
      views: 302,
      imageUrl:
          'https://akcdn.detik.net.id/visual/2023/10/18/evakuasi-ka-argo-semeru-anjlok-di-wates-akhirnya-rampung_169.jpeg?w=650&q=90',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  const Article(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.authorImageUrl,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt});

  List<Object> get props => [];
}
