import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int, String) onChangeSteps;
  const AuthScreen({Key? key,
  required this.onChangeSteps
  }) : super(key: key);


  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RegExp emailReg = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String _email = "";
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Everyone has\n".toUpperCase(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 30.0),
                      children: [
                        TextSpan(
                          text: "nkownledge\n".toUpperCase(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "to share".toLowerCase())
                      ]),
                ),
                const Text(
                  "It all start here.",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // prend toute la largeur de la colone
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Enter your email"),
                      ),
                      TextFormField(
                        validator: (value) =>value!.isEmpty||!emailReg.hasMatch(value)
                        ? "Entrer un email valide"
                        :null,
                        onChanged: (value) => setState(() {
                          _email = value;
                        }),
                        decoration: InputDecoration(
                            hintText: "Ex: momo@gmail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            )),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if(_formkey.currentState!.validate()){
                              print(_email);
                              widget.onChangeSteps(1,_email);
                            }
                          },
                          child: Text(
                            "continue".toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
