// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flightbooking/Data.dart';
import 'package:flutter/material.dart';
import '../Screens/Bottom_Bar.dart';
import '../Screens/StarterScreen.dart';
import '';
import '../Utils/AppStyles.dart';

class User {
  final String username;
  final String email;
  final String password;

  final bool acceptTerms;

  User({
    required this.username,
    required this.email,
    required this.password,
    required String Gender,
    required String Language,
    required this.acceptTerms,
  });
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

bool acceptTerms = false;
String selectedLanguage = 'English';
List<String> languageOptions = ['English', 'Arabic'];
String selectedGender = '';

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //this decoration is for the picture background

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        padding: const EdgeInsets.symmetric(horizontal: 10),

// hayda l column contain everything in the page w hene centered

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Your Account,",
              style: Styles.registerLine,
            ),
            Text(
              "And Let's Enjoy Your Journey!",
              style: Styles.registerLine,
            ),

            Text(
              "Sign Up",
              style: Styles.headlinestyle2,
            ),

// hayde l padding  he 50 from both  sized of the texts fields la kel wahad ma3melo padding wahdo
// fia controller lal text fields biyekhd  l text menon la nest3melon later
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _usernameController,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  contentPadding: const EdgeInsets.all(12),
                  labelText: 'User Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  contentPadding: const EdgeInsets.all(12),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  contentPadding: const EdgeInsets.all(12),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            //sign up button  ma7touta hie wl Sign In button bi row  taykuno 3a fard moustawa w centered

            //l sign in button  first btekhd  l values mnl text fields using the controllers
            //and then  btchuf isa hal values l user mfawatoun ma7toutin bel list li bel folder 3end rene esmo Data.dart
            // iza keno  mawjudin fia btekhdna 3al l page  li  esma Bottom_Bar  li fia all the pages
            //

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    var enteredUsername = _usernameController.text;
                    var enteredEmail = _emailController.text;
                    var enteredPassword = _passwordController.text;

                    if (enteredUsername.isNotEmpty &&
                        enteredEmail.isNotEmpty &&
                        enteredPassword.isNotEmpty &&
                        selectedGender.isNotEmpty &&
                        selectedLanguage.isNotEmpty &&
                        acceptTerms) {
                      if (!NewUser.any(
                          (user) => user.username == enteredUsername)) {
                        NewUser.add(User(
                          username: enteredUsername,
                          email: enteredEmail,
                          password: enteredPassword,
                          Gender: selectedGender,
                          Language: selectedLanguage,
                          acceptTerms: acceptTerms,
                        ));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bottom_Bar(
                              username: enteredUsername,
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                'Username already exists. Please choose a different one.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Please fill in all the required fields and accept terms.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Preferred Language: '),
                DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  items: languageOptions.map((language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text('Accept Terms and Conditions'),
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
