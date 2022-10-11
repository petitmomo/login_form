import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int?, String?) onChangeSteps;
  const PasswordScreen({Key? key,
  required this.onChangeSteps,
  }) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final bool _isSecret = true;
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () => widget.onChangeSteps(0, null),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Text(
                  "password".toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 50.0,),
                Form(
                  key:_formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // prend toute la largeur de la colone
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Enter your password"),
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() {
                                    _password = value;           
                                  }),
                        validator: (value) => value!.length < 6 ? "Le mot de passse doit être supérieur à 6 caractères"
                        :null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                            // suffixIcon: InkWell(
                            //   onTap: () => print("change"),
                            // ),
                            hintText: "password",
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
                            ),
                            ),
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
                              widget.onChangeSteps(null, _password);
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
