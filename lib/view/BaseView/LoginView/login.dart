import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricer_project/view/BaseView/LoginView/bloc/login_bloc.dart';
import 'package:pricer_project/view/BaseView/bloc/page_bloc.dart';
import 'package:pricer_project/view/widget/snackbar_notification.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  _handleLogin() {
    if (_email == null || _password == null) {
      WidgetNotificationSnackbar().render(context: context, color: Colors.red, message: 'Please Input Username or Password');
    } else {
      BlocProvider.of<LoginBloc>(context).add(LoginAccount(email: _email, password: _password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          WidgetNotificationSnackbar().render(context: context, color: Colors.red, message: state.message);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SizedBox(
              height: 250,
              width: 300,
              child: Image.asset(
                'assets/images/shop.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "SHOPIZIER",
                  style: GoogleFonts.kurale(
                    textStyle: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
              child: TextFormField(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 40.0, left: 40.0),
              child: TextFormField(
                obscureText: true,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            BlocBuilder<PageBloc, PageState>(
              builder: (context, state) {
                if (state is PageLogin) {
                  return _loginWidgetButton();
                }
                if (state is PageRegis) {
                  return _registWidgetButton();
                }
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginWidgetButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 40.0, left: 40.0),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginLoading) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return RaisedButton(
              color: Colors.orange[600],
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
              child: Text(
                'LOG IN',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _handleLogin(),
            );
          }),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(
            children: <Widget>[],
          ),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: Colors.grey[500],
                    height: 36,
                  )),
            ),
            Text("or"),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: Colors.grey[500],
                    height: 36,
                  )),
            ),
          ]),
          Row(
            children: <Widget>[],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(right: 40.0, left: 40.0),
          child: RaisedButton(
            color: Colors.white,
            // textColor: Colors.white,
            // padding: const EdgeInsets.all(16),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.grey[700]),
            ),
            onPressed: () => BlocProvider.of<PageBloc>(context).add(SelectedPage(pageState: 'Register')),
          ),
        ),
      ],
    );
  }

  Widget _registWidgetButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 40.0, left: 40.0),
          child: RaisedButton(
            color: Colors.orange[600],
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
            child: Text(
              'REGISTER NOW',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => BlocProvider.of<PageBloc>(context).add(SelectedPage(pageState: 'Login')),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(
            children: <Widget>[],
          ),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: Colors.grey[500],
                    height: 36,
                  )),
            ),
            Text("already have account?"),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: Colors.grey[500],
                    height: 36,
                  )),
            ),
          ]),
          Row(
            children: <Widget>[],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(right: 40.0, left: 40.0),
          child: RaisedButton(
            color: Colors.white,
            // textColor: Colors.white,
            // padding: const EdgeInsets.all(16),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
            child: Text(
              'LOG IN',
              style: TextStyle(color: Colors.grey[700]),
            ),
            onPressed: () => BlocProvider.of<PageBloc>(context).add(SelectedPage(pageState: 'Login')),
          ),
        ),
      ],
    );
  }
}
