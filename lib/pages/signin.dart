import 'package:chatapp/pages/home.dart';
import 'package:chatapp/pages/sign_up.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/services/shared_prefrences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  String name = '';
  String pic = '';
  String username ='';
  String id ='';
  TextEditingController userMailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

QuerySnapshot querySnapshot = await DatabaseMethods().getUserByEmail(email);
name = '${querySnapshot.docs[0] [ 'Name']}';
username = '${querySnapshot.docs[0] [ 'username']}';
pic = '${querySnapshot.docs[0] [ 'photo']}';
id = querySnapshot.docs[0].id;

await SharedPrefrencesHelper().saveUserDisplayName(name);
await SharedPrefrencesHelper().saveUserName(username);
await SharedPrefrencesHelper().saveUserId(id);
await  SharedPrefrencesHelper().saveUserPic(pic);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No User Found for that Email',
              style: TextStyle(fontSize: 20.0),
            )));
      }else if(e.code == 'wrong-password' || e.code == 'wrong - email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'Password or Email is Wrong',
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.75,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 105.00),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                      child: Text(
                    'Login to your Account',
                    style: TextStyle(
                        color: Color(0xFFbbb0ff),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 5.0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: userMailController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: const  InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Color(0xFF7f30fe),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child:  TextFormField(
                                  controller: userPasswordController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  decoration:const  InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Color(0xFF7f30fe),
                                      )),
                                  obscureText: true,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 130,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 5,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                         if(_formkey.currentState!.validate()){
                                           setState(() {
                                             email = userMailController.text;
                                             password = userPasswordController.text;
                                           });
                                         }
                                         userLogin();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF6380fb),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          'Sign Up Now!',
                          style: TextStyle(
                              color: Color(0xFF7f30fe),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
