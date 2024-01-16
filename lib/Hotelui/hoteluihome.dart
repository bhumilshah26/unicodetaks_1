import 'package:flutter/material.dart';
import 'package:hotbook/Hotelui/hotellist.dart';
import 'package:http/http.dart' as http;
import 'Navigation.dart';
import 'dart:convert';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  get animationController => null;

  @override
  State<HomePageUI> createState() => HomePageUIState();
}
class HomePageUIState extends State<HomePageUI> {
  String a ='', b = '', c = '';
  void fetchData() async {
    var url = Uri.parse('https://worldwide-hotels.p.rapidapi.com/search');
    var headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '00809ea8f4mshfb87c6f870cd390p17437fjsn82f8bcfc886d',
      'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com',
    };
    var body = {
      'location_id': '1532344',
      'language': 'en_IN',
      'currency': 'INR',
      'offset' : '0'
    };

    var response = await http.post(url, headers: headers, body: body);
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      a = jsonData["results"]["data"][0];
      b = jsonData["results"]["data"][1];
      c = jsonData["results"]["data"][2];
    }
  }

  @override
  void initState(){
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: Image.asset('assets/hotelimage.jpg',
              fit: BoxFit.cover,),
            ),
              Positioned(
                top: 60.0,
                  left:20.0,
                  height: 50.0,
                  width: size.width * 0.88,
                  child: const SearchBar(
                   leading: Icon(Icons.search,color: Colors.grey,),
                    hintText: 'Search for place',
              )),
              const Positioned(
                top:310.0,
                  left:20.0,
                  child: Text('Explore\nReal Greece',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      fontSize: 40
                    ),)
              ),
              Positioned(
                top: 410,
                  left: 20.0,
                  height: 40.0,
                  width: size.width * 0.35,
                  child: ElevatedButton(
                  onPressed: () {  },
                  child: const Text('Book Now'),))
          ]
        ),
          const SizedBox(height: 20,),
          const Text(' Most Popular',style: TextStyle(fontSize: 25,),),
          const SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetails(
                            title: items[index].title,
                            image: items[index].imageUrl,
                            color: items[index].color,
                            location: items[index].location,
                          )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(items[index].imageUrl,
                              height: 140,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 6,),
                            Text(items[index].title,
                            style: const TextStyle(
                              fontSize:18,
                              color: Colors.black
                            ),),
                            const SizedBox(height: 6,),
                            const Text('13 to 19 Nov\n\$300',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),

      ],
    ),
      bottomNavigationBar: navigationBar(),
  );
  }
}

class ListItem {


  String title;
  String imageUrl;
  final Color color;
  final String location;

  ListItem(this.title, this.imageUrl, this.color, this.location);
}

List<ListItem> items = [
  ListItem('wkjbf', 'assets/hawaii1jpg.jpg',Colors.black,'Hawaii'),
  ListItem('Otogin', 'assets/sydney.jpg',Colors.white,'Sydney'),
  ListItem('ITC', 'assets/switzerland.jpg',Colors.white,'Switzerland'),
  ListItem('Antilia', 'assets/norway.jpg',Colors.white,'Norway'),
  ListItem('Sartaj', 'assets/sartaj.jpg',Colors.white,'India'),
];
