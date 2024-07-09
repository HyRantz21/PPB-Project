import 'package:flutter/material.dart';
import 'package:project_beta/homepage.dart';
import 'package:project_beta/service/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Wellcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),

              //form
              Loginform(),
              //-- end form

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('dont have account?'),
                    Text(
                      ' Register now!',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => LoginformState();
}

class LoginformState extends State<Loginform> {
  final _formkey = GlobalKey<FormState>();

  @override
  final ApiService _apiService = ApiService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    var result =
        await _apiService.login(_nameController.text, _passwordController.text);
    if (result['token'] != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('fdssdsdf'),
      ));
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          //username or email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'example@mail.com'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Username cant be blank';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'password'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'password cant be blank';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState?.validate() ?? true) {
                    // Process form data
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 0),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(20),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Set border radius
                    ),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
