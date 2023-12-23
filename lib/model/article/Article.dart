class Article {
  late int id;
  late String title;
  late String description;
  late String thumbanail;
  late DateTime createdAt;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbanail,
    required this.createdAt,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbanail = json['thumbnail'];
    createdAt = DateTime.parse(json['created_at']);
  }

  var jsonArticleList = [
    {
      "id": 1,
      "title":
          "Apakah Wajib Penumpang Kereta Daftar Face Recognition? Berikut Penjelasan PT KAI",
      "description":
          "<p>Media sosial X, dulunya Twitter, diramaikan keluhan penumpang kereta terkait kebijakan&nbsp;<em><a href=\"https://www.liputan6.com/tag/face-recognition\">face recognition</a></em>&nbsp;(pengenalan wajah) yang diterapkan oleh PT Kereta Api Indonesia (KAI). Keluhan tersebut berfokus pada&nbsp;perbedaan perlakuan yang diterima penumpang yang sudah mendaftar&nbsp;<em>face recognition</em>&nbsp;dan tidak saat proses&nbsp;<em>boarding</em>&nbsp;kereta api. Apakah&nbsp;<em>face recognition</em>&nbsp;benar-benar diwajibkan?</p>\r\n\r\n<p>Joni Martinus, Vice President Public Relations&nbsp;<a href=\"https://www.liputan6.com/tag/pt-kai\">PT KAI</a>, menyatakan bahwa penumpang masih memiliki opsi untuk&nbsp;<em>boarding</em>&nbsp;secara manual tanpa perlu mengandalkan&nbsp;<em>face recognition</em>. Meskipun beberapa&nbsp;<em>gate</em>&nbsp;stasiun telah menerapkan kewajiban penggunaan&nbsp;<em>face recognition</em>, terdapat pintu alternatif lain yang tidak mensyaratkan penggunaan teknologi tersebut.<br />\r\n&nbsp;</p>\r\n\r\n<p>&quot;Saat ini, sejumlah&nbsp;<em>gate</em>&nbsp;stasiun memang dikhususkan hanya melayani&nbsp;<em>boarding</em>&nbsp;melalui&nbsp;<em>Face Recognition</em>, seperti pintu selatan&nbsp;<a href=\"https://www.liputan6.com/tag/stasiun-gambir\">Stasiun Gambir</a>&nbsp;dan pintu utara&nbsp;<a href=\"https://www.liputan6.com/tag/stasiun-bandung\">Stasiun Bandung</a>. Menanggapi&nbsp;<em>postingan</em>&nbsp;viral di media sosial X, kami menyampaikan bahwa bagi pelanggan yang belum mendaftar ataupun enggan menggunakan fasilitas&nbsp;<em>Face Recognition</em>, bisa melakukan&nbsp;<em>boarding</em>&nbsp;secara manual di pintu utara Stasiun Gambir dan pintu selatan Stasiun Bandung,&quot; ungkap Joni dalam pesan tertulisnya kepada&nbsp;<strong><a href=\"https://www.liputan6.com/tag/liputan6com\">Liputan6.com</a></strong>&nbsp;pada Selasa, 21 November 2023.</p>\r\n\r\n<p>Joni menjelaskan, fasilitas&nbsp;<em>boarding</em>&nbsp;manual&nbsp;tersebut diambil&nbsp;sebagai langkah antisipatif jika terjadi kendala atau masalah pada sistem&nbsp;<em>face recognition</em>.</p>\r\n\r\n<p>&quot;Namun demikian, KAI tetap menyiagakan fasilitas&nbsp;<a href=\"https://www.liputan6.com/tag/boarding\">boarding</a>&nbsp;manual di pintu selatan Stasiun Gambir dan pintu utara Stasiun Bandung untuk mengantisipasi apabila ada terjadi hal-hal yang mengakibatkan sistem&nbsp;<em>Face Recognition</em>&nbsp;tersebut tidak dapat dipakai atau sedang bermasalah,&quot; tambah Joni.</p>",
      "thumbnail":
          "public/article/fkXlcYa4869hB7WqcbUxICnVhNvKXt4ZcNpvIVeH.webp",
      "deleted_at": null,
      "created_at": "2023-11-27T02:18:16.000000Z",
      "updated_at": "2023-11-27T02:18:16.000000Z"
    },
    {
      "id": 3,
      "title":
          "Cara Beli Tiket Kereta Api Libur Natal dan Tahun Baru di Access by KAI",
      "description":
          "<p>Libur Natal dan Tahun Baru 2024 semakin dekat. Masyarakat kini sudah dapat memesan tiket&nbsp;<a href=\"https://www.liputan6.com/lifestyle/read/5451258/sudah-terjual-lebih-dari-102-ribu-tiket-kereta-api-periode-libur-natal-2023-masih-tersedia\">kereta api</a>&nbsp;di berbagai platform resmi penjualan&nbsp;<a href=\"https://www.liputan6.com/tag/tiket-kereta-api\">tiket kereta api</a>&nbsp;KAI.</p>\r\n\r\n<p>PT Kereta Api Indonesia (Persero) mengugngkapkan, keunggulan yang tidak ada di aplikasi lain dapat dijumpai pada&nbsp;<a href=\"https://www.liputan6.com/tag/access-by-kai\">Access by KAI</a>&nbsp;seperti Connecting Train (opsi perjalanan dengan mengombinasikan jadwal kereta yang bersifat persambungan jika tiket yang diinginkan sudah habis) serta perubahan jadwal atau pembatalan tiket.</p>\r\n\r\n<p>&quot;Sehingga memudahkan pelanggan dalam memesan tiket khususnya pada Peak Season seperti Angkutan Natal dan Tahun Baru,&quot; lanjut dia.</p>\r\n\r\n<p>Saat ini, pelanggan dapat memesan tiket kereta api jarak jauh mulai H-45 hingga 1 jam sebelum keberangkatan. Dalam satu kali transaksi, pelanggan dapat memesan maksimal 10 tiket dalam 1 kode booking (di luar tiket infant).</p>\r\n\r\n<h2>Cara Beli Tiket Kereta Api</h2>\r\n\r\n<p>Berikut cara-cara membeli tiket kereta api melalui Access by&nbsp;<a href=\"https://www.liputan6.com/tag/kai\">KAI</a>:</p>\r\n\r\n<ol>\r\n\t<li>Login dengan nomor ponsel atau akun Google.</li>\r\n\t<li>Pilih jenis kereta yang ingin Anda beli tiketnya. Terdapat pilihan Antar Kota, Lokal, Commuter Line, LRT Jabodebek, KA Bandara, serta Kereta Cepat Whoosh.</li>\r\n\t<li>Pilih tujuan keberangkatan dan kedatangan.</li>\r\n\t<li>Pilih tanggal keberangkatan. Anda juga bisa membeli tiket pergi pulang dengan mengaktifkan tombolnya di samping tanggal keberangkatan, lalu masukkan tanggal pulang di bagian bawahnya.</li>\r\n\t<li>Masukkan jumlah penumpang.</li>\r\n\t<li>Tekan tombol Cari Tiket Antar Kota.</li>\r\n\t<li>Pilih kereta yang Anda inginkan. Sebagai catatan, Anda dapat juga memilih tanggal lain selain yang dipilih sebelumnya dengan menekan baris tanggal di bagian atas layar.</li>\r\n\t<li>Isi data penumpang.</li>\r\n\t<li>Pilih kursi yang diinginkan.</li>\r\n\t<li>Pastikan data penumpang dan pembayaran telah terisi dengan benar.</li>\r\n\t<li>Lanjutkan dengan membayar tiket&nbsp;<a href=\"https://www.liputan6.com/tag/kereta-api\">kereta api</a>&nbsp;yang ingin dipesan.</li>\r\n</ol>",
      "thumbnail":
          "public/article/OH5qq4WEFcXVhYheu28lyAD6Zu3G6Uu1LBj275um.webp",
      "deleted_at": null,
      "created_at": "2023-11-27T02:22:13.000000Z",
      "updated_at": "2023-11-27T02:22:13.000000Z"
    },
    {
      "id": 4,
      "title":
          "KAI Ingatkan Penumpang Agar Membeli Tiket Kereta Sesuai Tujuan, Bakal Kena Sanksi karena Kursi Penumpang Sering Dobel",
      "description":
          "<p>Sering kali saat naik&nbsp;<a href=\"https://www.liputan6.com/tag/kereta-api\">kereta api</a>, ditemukan penumpang dengan pemilik kursi dobel. Hal itu terjadi lantaran ada penumpang yang tidak membeli tiket sesuai dengan tujuan akhirnya.</p>\r\n\r\n<p>PT Kereta Api Indonesia (KAI)&nbsp;pun mengingatkan kembali untuk tidak berbuat curang saat naik&nbsp;<a href=\"https://www.liputan6.com/tag/kereta\">kereta</a>&nbsp;api melalu sebuah konten edukasi. &quot;Kami sering menemukan orang yang melebihi tujuan yang tertera di tiket, epic banget kan? tanya seorang pria yang berperan sebagai konduktor di kereta api, dari video Reels Instagram yang diunggah Jumat (27/10/2023).&nbsp;</p>\r\n\r\n<p><em>&quot;Oh yang beli tiket pakai tarif khusus Surabaya-Madiun, tapi diem-diem lanjut sampai Solo itu ya kak,&quot;</em>&nbsp;balas perempuan disebelah kondektur.</p>\r\n\r\n<p><em>&quot;Modusnya sih pindah ke kereta makan atau ngumpet di toilet kali ya?&quot;</em>&nbsp;tambah wanita di sebelahnya lagi.</p>\r\n\r\n<p><em>&quot;Oh jadi ini yang suka bikin kasus double seat di kereta?&quot;</em>&nbsp;sambung temannya.</p>\r\n\r\n<p>Sang kondektur pun kemudian menjelaskan bahwa sejak 3 Agustus 2023,&nbsp;<a href=\"https://www.liputan6.com/tag/pt-kai\">PT KAI</a>&nbsp;sudah mulai memberikan sangsi atau denda dan tidak diperkenankan naik kereta untuk sementara waktu bagi penumpang yang sengaja melebihi tujuan atau rute yang tertera di tiketnya.&nbsp;</p>\r\n\r\n<p>Berbagai perilaku&nbsp;<a href=\"https://www.liputan6.com/tag/penumpang-kereta\">penumpang kereta</a>&nbsp;yang tidak jujur seperti itu bisa mengganggu ketertiban dan kenyamanan penumpang lain, inilah yang menyebabkan kasus tempat duduk dobel saat di atas KA. &quot;Jangan sampai karena &quot;kenakalan&quot; kalian berujung sanksi denda, atau bahkan tidak diperbolehkan naik kereta untuk sementara waktu,&quot; pihak PT KAI menegaskan.</p>",
      "thumbnail":
          "public/article/WjdcDcLI7gkQ6RvI52CBeCFfEilh5NkeiqvMQqNG.webp",
      "deleted_at": null,
      "created_at": "2023-11-27T02:24:34.000000Z",
      "updated_at": "2023-11-27T02:24:34.000000Z"
    }
  ];
}
