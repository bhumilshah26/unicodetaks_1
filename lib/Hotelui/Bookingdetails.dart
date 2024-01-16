import 'package:flutter/material.dart';
import 'package:hotbook/Login.dart';

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
          reusableTextField('Name', Icons.account_circle, false,nameCtrl),
          const SizedBox(height: 30,),
          reusableTextField('Phone number', Icons.call, false,phoneCtrl),
          const SizedBox(height: 30,),
          reusableTextField('Email(optional)', Icons.mail_outline, false,emailCtrl),
          const SizedBox(height: 30,),
          reusableTextField('Check-IN(DD-MM-YYYY)', Icons.calendar_month, false,chkinCtrl),
          const SizedBox(height: 30,),
          reusableTextField('Check-OUT', Icons.calendar_month, false,chkoutCtrl),
          const SizedBox(height: 30,),
          reusableTextField('Payment', Icons.monetization_on_sharp, false,payCtrl),
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
