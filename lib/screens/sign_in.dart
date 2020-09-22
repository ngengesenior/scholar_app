import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scholar_app/utils/utils.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(  // Wrap in form widget for input validation
          key: _formKey,
          child: SingleChildScrollView(  //Wrap in SingleChildScrollView to avoid bottom overflow
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (val) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val)) {
                      return null;
                    } else
                      return "Please enter a valid email address";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 17, color: Constants.accentColor),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (newValue) {},
                    ),
                    Text(
                      "Remember me next time",
                      style: TextStyle(color: Constants.accentColor),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(

                    color: Constants.accentColor,
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Form is valid"),));
                      } else{
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Form has errors"),));

                      }
                    },
                    child: Text("Sign In",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Didn't receive confirmation message?"),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Don't have an account?Sign up",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.facebook,
                        size: 50, color: Constants.facebookBlue),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      MdiIcons.googlePlus,
                      size: 50,
                      color: Constants.googleRed,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(MdiIcons.twitter, size: 50, color: Constants.twitterBlue)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 12,
        title: Center(
          child: Text(
            "Sign In",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white),
          ),
        ),
        toolbarHeight: kToolbarHeight * 2.5,
        // Make the appbar 2.5 times larger than the normal toolbar
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(100))),
      ),
    );
  }
}
