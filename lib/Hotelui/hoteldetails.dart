import 'package:flutter/material.dart';

class BookingHotel extends StatefulWidget {
  final String image;
  final String title;
  final String location;
  const BookingHotel({super.key, required this.image, required this.title, required this.location});

  @override
  State<BookingHotel> createState() => _BookingHotelState();
}

class _BookingHotelState extends State<BookingHotel> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top:0,
              left:0,
              height: 450,
              width: size.width,
                child: Image.asset(widget.image,
                fit: BoxFit.cover,),),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  width: size.width,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                color: Color.fromRGBO(2, 28, 77, 1.0),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(widget.location,style: const TextStyle(
                                fontSize: 25
                              ),),
                              const SizedBox(width: 150,),
                              const Icon(Icons.location_on,color: Colors.red,),
                              const Text('Maps',
                                style: TextStyle(
                                    color: Colors.grey
                                ),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Text('This upscale, contemporary hotel is 2 km from Hazrat'
                              'Shahjalal International Airport and 11 km from Jatiyo'
                              'Sangsad Bhaban, the Bangladesh Parliament complex',
                          style: TextStyle(
                            color: Colors.grey
                          ),),
                          const SizedBox(height: 30,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price',style: TextStyle(color: Colors.grey),),
                              Text('Reviews',style: TextStyle(color: Colors.grey)),
                              Text('Recently Booked',style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          const Row(
                            children: [
                              Text('\$150'),
                              SizedBox(width: 60,),
                              Icon(Icons.star, size: 15),
                              Icon(Icons.star, size: 15),
                              Icon(Icons.star, size: 15),
                              Icon(Icons.star, size: 15),
                              Icon(Icons.star_border,size: 15),
                              SizedBox(width: 100,),
                              Icon(Icons.people_alt_outlined,)
                            ],
                          ),
                          const SizedBox(height:30 ,),
                          const Text('Amenities',style: TextStyle(fontSize: 30),),
                          SizedBox(height: 10,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Amenities(image: 'assets/amenity1.jpg'),
                              Amenities(image: 'assets/bar.jpg'),
                              Amenities(image: 'assets/boating.jpg'),
                              Amenities(image: 'assets/poolboard.jpg'),
                              Column(
                                children: [
                                  Icon(Icons.more_horiz_outlined,size: 30,),
                                  Text('More')
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 35,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isFavourite = !isFavourite;
                                  });
                              },
                                child: Icon(
                                  isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
                                  size: 30,
                                  color: isFavourite ? Colors.red : Colors.black,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  shape: const StadiumBorder(),
                                  minimumSize: Size(size.width * 0.6, 50),
                                  shadowColor: const Color.fromRGBO(2, 25, 69, 0),
                                ),
                                onPressed: () {},
                                child: const Text('Book now',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),

    );
  }
}


class Amenities extends StatelessWidget {
  final String image;
  const Amenities({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(image,
      height: 54,
      width: 55,
      fit: BoxFit.cover,),
    );
  }
}
