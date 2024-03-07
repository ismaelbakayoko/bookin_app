import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ismo_travel_app/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Future<void> onSingnUp() async {
    final Url = Uri.parse(
        "http://192.168.1.22/tourisme_journey_api/connexion/register.php");
    final headers = {'content-type': 'application/json'};
    final body = jsonEncode({
      "firstName": nomController.text,
      "lastName": prenomController.text,
      "phone": numberController.text,
      "email": emailController.text,
      "password": passwordController.text
    });
    final response = await http.post(Url, headers: headers, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 255, 125, 126),
              Color.fromARGB(255, 236, 38, 125)
            ])),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Join us",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre nom';
                        }
                        return null;
                      },
                      controller: nomController,
                      decoration: const InputDecoration(
                        labelText: "Nom",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre prenom';
                        }
                        return null;
                      },
                      controller: prenomController,
                      decoration: const InputDecoration(
                        labelText: "Prenom",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre numero';
                        }
                        return null;
                      },
                      controller: numberController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: "Number",
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre password';
                        }
                        return null;
                      },
                      controller: repeatPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Repeat Password",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veillez entrer votre email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email Adress",
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate())
                                {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')))
                                },
                              onSingnUp()
                            },
                        child: GestureDetector(
                          onTap: () {
                            // if (_formKey.currentState!.validate())
                            //   {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(
                            //           content: Text('Processing Data')))
                            // }
                            onSingnUp();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 255, 125, 126),
                                          Color.fromARGB(255, 236, 38, 125)
                                        ])),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "S'inscrire",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.white, width: 1.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Already a member ?",
                    style: TextStyle(color: Color.fromARGB(150, 255, 255, 255)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: -2.0),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
