import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/comm 1.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 136,
            left: 47,
            right: 47,
            bottom: 600,
            child: Image.asset(
              'assets/logo/App Logo.png', // Update path to your logo
              width: 336,
              height: 46,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: const Text(
                      'Email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF24E1E),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email or Username',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFF24E1E),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFF24E1E),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFF24E1E),
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color(0xFFF24E1E)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
