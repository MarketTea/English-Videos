class ContentBoarding {
  String image;
  String title;
  String description;

  ContentBoarding({this.image, this.title, this.description});
}

List<ContentBoarding> contents = [
  ContentBoarding(
      title: 'Easy to Access',
      image: 'assets/quality.svg',
      description: "In our app you will learn how to promote yourself in English"
  ),
  ContentBoarding(
      title: 'Easy to Search',
      image: 'assets/delivery.svg',
      description: "You learn how to start a conversation to identify yourself, what questions to ask, and how to determine the flow of speech."
  ),
  ContentBoarding(
      title: 'Easy to Manage',
      image: 'assets/reward.svg',
      description: "It is very important to learn English at least enough to introduce yourself"
  ),
];
