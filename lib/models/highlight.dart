class Highlight {
  final String name, image;

  Highlight({
    required this.name,
    required this.image,
  });

  static List<Highlight> get highlights => [
        Highlight(
          name: "Reels",
          image: "assets/Reels-01.jpg",
        ),
        Highlight(
          name: "2x Speed 🚀",
          image: "assets/2x Speed-01.jpg",
        ),
        Highlight(
          name: "Tips",
          image: "assets/Tips-01.png",
        ),
        Highlight(
          name: "Packages",
          image: "assets/Packages-01.jpg",
        ),
        Highlight(
          name: "Packages",
          image: "assets/Quotes.jpg",
        ),
        Highlight(
          name: "Packages",
          image: "assets/Nemone kar-01.jpg",
        ),
        Highlight(
          name: "Packages",
          image: "assets/Learn-01.jpg",
        ),
      ];
}
