class ArticleModel{
  String image;
  String title;
  String source;
  DateTime date;
  ArticleModel({required this.source,required this.title,required this.image,required this.date});
  static List<ArticleModel>articles=[
    ArticleModel(source: "BBC", title: "Why are football's biggest clubs starting a newtournament?", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujYgGA83X-bf70YeHs5PPzJCP107naLymbg&s", date: DateTime.now()),
    ArticleModel(source: "BBC", title: "Why are football's biggest clubs starting a newtournament?", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujYgGA83X-bf70YeHs5PPzJCP107naLymbg&s", date: DateTime.now().subtract(Duration(hours: 2))),
    ArticleModel(source: "BBC", title: "Why are football's biggest clubs starting a newtournament?", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujYgGA83X-bf70YeHs5PPzJCP107naLymbg&s", date: DateTime.now().subtract(Duration(hours: 3))),
    ArticleModel(source: "BBC", title: "Why are football's biggest clubs starting a newtournament?", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujYgGA83X-bf70YeHs5PPzJCP107naLymbg&s", date: DateTime.now().subtract(Duration(hours: 4))),
    ArticleModel(source: "BBC", title: "Why are football's biggest clubs starting a newtournament?", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujYgGA83X-bf70YeHs5PPzJCP107naLymbg&s", date: DateTime.now().subtract(Duration(hours: 5))),
  ];
}
