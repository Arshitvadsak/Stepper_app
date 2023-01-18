import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Stepper_Page(),
    ),
  );
}

class Stepper_Page extends StatefulWidget {
  const Stepper_Page({Key? key}) : super(key: key);

  @override
  State<Stepper_Page> createState() => _Stepper_PageState();
}

class _Stepper_PageState extends State<Stepper_Page> {
  @override
  int initialstap = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper App"),
        backgroundColor: Colors.red,
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.red,
              ),
        ),
        child: Stepper(

          currentStep: initialstap,
          type: StepperType.vertical,
          onStepTapped: (value) {
            setState(() {
              initialstap = value;
            });
          },
          onStepContinue: () {
            setState(() {
              if (initialstap < 2) {
                ++initialstap;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (initialstap > 0) {
                --initialstap;
              }
            });
          },
          controlsBuilder: (context, detaile) {
            return Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        child: Text("CONTINUE"),
                        onPressed: detaile.onStepContinue),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: OutlinedButton(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(color: Colors.black54),
                        ),
                        onPressed: detaile.onStepCancel),
                  ),
                ],
              ),
            );
          },

          steps: [
            Step(
              title: const Text("SignUp"),
              content: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Full Name",
                        focusColor: Colors.cyan,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email ID",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Password",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Confirm Password",
                      ),
                    ),
                  ],
                ),
              ),
              isActive: (initialstap >= 0) ? true : false,
              state: StepState.indexed,
            ),
            Step(
              title: const Text("Login"),
              content: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "User Name",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 8,
                    ),
                  ],
                ),
              ),
              isActive: (initialstap >= 1) ? true : false,
              //state: ,
            ),
            Step(
              state: StepState.complete,
              title: const Text("Home"),
              content: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Ex. Welcome to....",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              isActive: (initialstap >= 2) ? true : false,
              //state: ,
            ),
          ],
        ),
      ),
    );
  }
}
