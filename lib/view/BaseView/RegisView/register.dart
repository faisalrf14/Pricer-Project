import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricer_project/view/BaseView/PageManagement/page_bloc.dart';

class RegisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(
            'assets/images/shop.jpg',
            fit: BoxFit.contain,
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text("SHOPIZIER",
              style: GoogleFonts.kurale(
                textStyle: TextStyle(fontSize: 25.0),
              )),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
          child: TextFormField(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 40.0, left: 40.0),
          child: RaisedButton(
            color: Colors.orange[600],
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0)),
            child: Text(
              'REGISTER NOW',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => BlocProvider.of<PageBloc>(context)
                .add(SelectedPage(pageState: 'Login')),
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
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0)),
            child: Text(
              'LOG IN',
              style: TextStyle(color: Colors.grey[700]),
            ),
            onPressed: () => BlocProvider.of<PageBloc>(context)
                .add(SelectedPage(pageState: 'Login')),
          ),
        ),
      ],
    );
  }
}
