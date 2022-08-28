
class ListItemData {
  String imagePath;
  String? hint;
  String title;
  String name;
  DateTime date;
  String address;
  int numOfViews = 0;
  bool isLiked = false;
  bool isVerified = false;

  ListItemData(this.imagePath,this.hint, this.title, this.name, this.date, this.address,
      this.numOfViews, this.isLiked, this.isVerified);
}
