class Event{
  final String tittle;
  final String date_time;
  final String location;
  final String maxpeople;
  final String joinedpeople;
  final String image;
  final String members;
  final String maxmember;

  Event({required this.maxmember, required this.members ,required this.image, required this.tittle, required this.date_time, required this.location, required this.maxpeople, required this.joinedpeople});
}
class Category{
  final String categories;

  Category({required this.categories});
}