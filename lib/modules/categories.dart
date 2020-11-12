class Category {
  String icon;
  String name;
  int fileCount;
  Category({this.name, this.icon, this.fileCount});
}

List<Category> categories = [
  Category(icon: "assets/icons/images.svg", name: "Images", fileCount: 200),
  Category(icon: "assets/icons/documents.svg", name: "Documents", fileCount: 130),
  Category(icon: "assets/icons/music-note.svg", name: "Music", fileCount: 68)
];