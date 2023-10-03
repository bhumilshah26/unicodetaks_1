import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotbook/SignUp.dart';
import 'package:hotbook/HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Stream<List<User>> readUsers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  TextEditingController eCtrl1 = TextEditingController();
  TextEditingController eCtrl2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool passwordVal = false;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/hotelbgimage.jpg'),
              fit: BoxFit.cover
          )
      ) ,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
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
                          TextField(
                            controller: eCtrl2,
                            decoration: InputDecoration(
                                hintText: 'Enter password',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                suffixIcon: passwordVal == false ? GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        passwordVal = !passwordVal;
                                      });
                                    },
                                    child: const Icon(Icons.remove_red_eye)) :
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        passwordVal = !passwordVal;
                                      });
                                    },
                                    child: const Icon(Icons.done))                        ),
                            obscureText: passwordVal,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 60,),
                            ],
                          ),
                          ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(2, 28, 77, 1.0),
                              elevation: 15,
                              shape: const StadiumBorder(),
                              minimumSize: const Size.fromHeight(60),
                              shadowColor:const Color.fromRGBO(2, 25, 69, 0),
                            ),
                            onPressed: (){
                              // final email = eCtrl1.text;
                              // final pass = eCtrl2.text;

                              FirebaseAuth.instance.signInWithEmailAndPassword(email: eCtrl1.text, password: eCtrl2.text)
                              .then((value) => {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
                              });
                              eCtrl1.text = '';
                              eCtrl2.text = '';
                            },
                            child:const Text('Login',
                                style: TextStyle(
                                    color: Colors.white)
                            ),
                          ),
                          const SizedBox(height: 20,),

                          TextButton(onPressed: (){},
                            child:const Center(
                              child: Text('Forgot Password ?',
                                style: TextStyle(
                                    color: Color.fromRGBO(2, 28, 77, 1.0)
                                ),
                              ),
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have account ?"),
                              TextButton(onPressed: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                              },
                                  child: const Text('Sign UP',
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
      ),
    );


  }
}


