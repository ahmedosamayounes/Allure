class Cover {
  String image;
  String name;


  Cover({
    required this.image,
    required this.name,

  });

  static List<Cover> products = [

     Cover(
      image: 'assets/images/cover/cover2.png',
      name: 'Red collection',
   
    ),
    Cover(
      image: 'assets/images/cover/cover3.png',
      name: 'Black collection',
   
    ),
   
    Cover(
      image: 'assets/images/cover/cover1.png',
      name: 'White collection',

    ),


  ];
}
