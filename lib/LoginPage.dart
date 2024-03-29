import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/amongus.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amberAccent,
        body: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoContainer(),
                  buildEmail(),
                  buildPassword(),
                  buildForgotPassword(),
                  buildSubmit(),
                  buildRegister(),
                ],
              ),
            )
        )
    );
  }

  Widget buildEmail() => Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder()
        ),
        onSaved: (value) => setState(() => email = value!),
      )
  );

  Widget buildPassword() => Container(
    margin: EdgeInsets.only(top: 8),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder()
      ),
      onSaved: (value) => setState(() => password = value!),
      obscureText: true,
    ),
  );

  Widget buildForgotPassword() => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: const Text('Forgot password', style: TextStyle(decoration: TextDecoration.underline)),
            onPressed: () {
              Navigator.of(context).pushNamed('/ForgotPasswordPage');
            },
          ),
        ],
      )
  );

  Widget buildSubmit() => Container(
    margin: EdgeInsets.only(top: 8),
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.indigo,
    ),
    child: TextButton(
      style: TextButton.styleFrom(
          primary: Colors.amberAccent
      ),
      child: Text('Sign in', style: TextStyle(fontSize: 19)),
      onPressed: () {

      },
    ),
  );

  Widget buildRegister() => Container(
    margin: EdgeInsets.only(top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('...or you can', textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
        Container(
          margin: EdgeInsets.only(top: 13),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text('Sign up', style: TextStyle(fontSize: 19)),
            onPressed: () {
              Navigator.of(context).pushNamed('/SignUpPage');
            },
          ),
        )
      ],
    ),
  );
}