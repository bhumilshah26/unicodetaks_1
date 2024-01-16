import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hotbook/Hotelui/Bookingdetails.dart';
import 'package:hotbook/Hotelui/hoteldetails.dart';
class HotelDetails extends StatefulWidget {
  final String title;
  final String image;
  final Color color;
  final String location;
  const HotelDetails({Key? key, required this.title, required this.image, required this.color, required this.location})
      : super(key: key); // Fix the constructor syntax

  @override
  _HotelDetailsState createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 540,
                left: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        BackdropFilter(filter: ImageFilter.blur(sigmaY: 5,sigmaX: 5),
                        child: Container(),),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white.withOpacity(0.13)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            , colors: [
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.05)
                              
                            ])
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(color:widget.color,fontSize: 30),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel,',
                                  style: TextStyle(color:widget.color,fontSize: 30),
                                ),
                                const SizedBox(
                                  width: 150,
                                ),
                                Text(
                                  '\$300/per night',
                                  style: TextStyle(color:widget.color,fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.location,
                                style: TextStyle(
                                  color: widget.color
                                ),),
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blue.withOpacity(0.7),
                                ),
                                Text(
                                  '2 km to city',
                                  style: TextStyle(
                                      color: widget.color
                                  ),),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.blue, size: 15),
                                const Icon(Icons.star, color: Colors.blue, size: 15),
                                const Icon(Icons.star, color: Colors.blue, size: 15),
                                const Icon(Icons.star, color: Colors.blue, size: 15),
                                const Icon(Icons.star_border, color: Colors.blue, size: 15),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('80 reviews',
                                  style: TextStyle(
                                      color: widget.color
                                  ),),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(2, 28, 77, 1.0),
                                  shape: const StadiumBorder(),
                                  shadowColor: Colors.blue.withOpacity(0.5),
                                  minimumSize: Size(size.width * 0.9, 50)),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingDetails()));
                              },
                              child: const Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 730,
                  left: size.width * 0.35,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookingHotel(
                            image: widget.image,
                            title: widget.title,
                            location: widget.location,)));
                        },
                        child:Text(
                          'More details',
                          style: TextStyle(color: widget.color),
                        ),
                      ),
                      Image.asset('assets/small_arrow.png',height:15,color: widget.color,)
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
