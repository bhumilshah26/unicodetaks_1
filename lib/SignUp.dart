import 'package:flutter/material.dart';

import 'Hotelui/hoteluihome.dart';
import 'Login.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController eCtrl1 = TextEditingController();
  TextEditingController eCtrl2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool passwordVal = false;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top:0,
          left:0,
          height: 300,
          width: size.width,
          child: Image.asset('assets/hotelbgimage.jpg',
            fit: BoxFit.cover,),),
            Positioned(
              bottom: 0,
              child: SizedBox(
              width: size.width,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('BookIt',style: TextStyle(color: Color.fromRGBO(2, 28, 77, 1.0),fontSize: 40,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 40,),
                      Text('Email address',style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 18),),
                      const SizedBox(height: 15,),
                      TextField(
                        controller: eCtrl1,
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5)
                            ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Password',style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 18),),
                      const SizedBox(height: 20,),
                      reusableTextField('Password',Icons.lock_outline, true, eCtrl2),
                      const SizedBox(height: 60,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(2, 28, 77, 1.0),
                            elevation: 15,
                            shape: const StadiumBorder(),
                            minimumSize: const Size.fromHeight(60),
                            shadowColor:const Color.fromRGBO(2, 25, 69, 0),
                        ),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageUI()));
                        },
                        child:const Text('Create my account',
                            style: TextStyle(
                                color: Colors.white)
                        ),
                      ),
                      const SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Already have an account ?'),
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          },
                              child: const Text('Sign IN',
                              style: TextStyle(
                                color: Color.fromRGBO(2, 28, 77, 1.0)
                              ),))
                        ],
                      )
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

class User {
  final String email;
  final String pass;
  String id;

  User({
    this.id = '',
    required this.email,
    required this.pass
});

  Map<String,dynamic> toJson() => {
    'id':id,
    'email':email,
    'pass': pass,
  };

  static User fromJson(Map<String,dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      pass: json['pass']
  );
}
