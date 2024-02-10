import 'package:flutter/material.dart';
import 'package:hotbook/SignUp.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errormsg = '';
  bool isLogin = false;

  final TextEditingController eCtrl1 = TextEditingController();
  final TextEditingController eCtrl2 = TextEditingController();

  final user = Auth().currentUser; //idhr

  Future<void> signInWithEmailAndPassword () async {
    try{
      await Auth().signInWithEmailAndPassword(email: eCtrl1.text, password: eCtrl2.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormsg = e.message!;
        eCtrl1.text = "";
        eCtrl2.text = "";
      });
    }
  }

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
              height: 500,
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
                          const SizedBox(height: 10,),
                          TextField(
                            controller: eCtrl1,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              hintText: 'Enter email',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5)
                              ),
                            ),
                          ),                          const SizedBox(height: 15,),
                          Text('Password',style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 18),),

                          const SizedBox(height: 20,),
                          TextField(
                            controller: eCtrl1,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              hintText: 'Enter email',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5)
                              ),
                            ),
                          ),                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
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
                            onPressed:signInWithEmailAndPassword,
                            child:const Text('Login',
                                style: TextStyle(
                                    color: Colors.white)
                            ),
                          ),
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
      );
  }
}