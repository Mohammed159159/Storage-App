class MyImage{
  String name;
  String image;
  DateTime date;
  double size;
  MyImage({this.name, this.size, this.date, this.image});
}

List<MyImage> myimages = [
  MyImage(name: "Town in Jakarta.jpg", size: 231, image: "assets/images/jakarta.jpg"),
  MyImage(name: "Sky in Jakarta.jpg", size: 25, image: "assets/images/skyin.jpg"),
  MyImage(name: "Art.jpg", size: 132, image: "assets/images/art.jpg"),
  MyImage(name: "Do It.jpg", size: 264, image: "assets/images/doit.jpg"),
  MyImage(name: "Hall.jpg", size: 275, image: "assets/images/hall.jpg"),
  MyImage(name: "Monkey.jpg", size: 139, image: "assets/images/monkey.jpg"),
  MyImage(name: "Sky.jpg", size: 348, image: "assets/images/sky.jpg"),
  MyImage(name: "Town.jpg", size: 254, image: "assets/images/town2.jpg"),
  MyImage(name: "Traffic.jpg", size: 232, image: "assets/images/traffic.jpg"),
  MyImage(name: "Volcano.jpg", size: 321, image: "assets/images/volcano.jpg"),
];

void sort(List<MyImage> images, String sortBy)
 {
   switch(sortBy)
   {
     case "date":
       images.sort((a, b) => a.date.compareTo(b.date));
       break;
     case "size":
       images.sort((a, b) => a.size.compareTo(b.size));
       break;
     default:
       print("Enter a valid sorting method");
       break;
   }

 }