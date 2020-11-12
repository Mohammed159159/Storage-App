class MyIcons {
  int iconIndex;
  String myIcon;
  String name;
  MyIcons({this.iconIndex, this.name, this.myIcon});
}

List<MyIcons> myicons = [
  MyIcons(iconIndex: 0, name: "Home", myIcon: "assets/icons/home.svg"),
  MyIcons(iconIndex: 1, name: "Files", myIcon: "assets/icons/file.svg"),
  MyIcons(iconIndex: 2, name: "Recent", myIcon: "assets/icons/time.svg"),
  MyIcons(iconIndex: 3, name: "Deleted", myIcon: "assets/icons/delete.svg")

];