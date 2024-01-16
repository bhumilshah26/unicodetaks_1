import 'package:flutter/material.dart';
import 'package:hotbook/Hotelui/hoteluihome.dart';
import 'package:hotbook/SignUp.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Positioned(
              top:0,
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
                          const SizedBox(height: 10,),
                          reusableTextField('abc@gmail.com', Icons.person_2_outlined, false, eCtrl1),
                          const SizedBox(height: 15,),
                          Text('Password',style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 18),),

                          const SizedBox(height: 20,),
                          reusableTextField('Password',Icons.lock_outline, true, eCtrl2),
                          const Row(
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
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageUI()));
                              eCtrl1.text = '';
                              eCtrl2.text = '';
                            },
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


TextField reusableTextField(String text, IconData icon, bool isPasswordType,TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon,color:Colors.grey,),
    labelText: text,
    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 0,style:BorderStyle.none ))
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

