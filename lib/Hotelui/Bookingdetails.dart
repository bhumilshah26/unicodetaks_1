import 'package:flutter/material.dart';
import 'package:hotbook/SignIn.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController chkinCtrl = TextEditingController();
  TextEditingController chkoutCtrl = TextEditingController();
  TextEditingController payCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 28, 77, 1.0),
        elevation: 3.0,
        title: const Text('Booking'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              hintText: 'Name',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: phoneCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.call),
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: chkinCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_month),
              hintText: 'Check-IN(DD-MM-YYYY)',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: chkoutCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_month),
              hintText: 'Check-Out(DD-MM-YYYY)',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: payCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.monetization_on_sharp),
              hintText: 'Payment',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5)
              ),
            ),
          ),
          SizedBox(height: size.height * 0.15,),
          Center(
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 28, 77, 1.0),
                  shape: const StadiumBorder(),
                  shadowColor: Colors.blue.withOpacity(0.5),
                  minimumSize: Size(size.width * 0.9, 50)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingDetails()));
              },
              child: const Text(
                'Book',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
