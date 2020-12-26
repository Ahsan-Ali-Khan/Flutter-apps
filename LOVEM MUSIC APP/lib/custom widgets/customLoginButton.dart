import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
class CustomLoginButton extends StatelessWidget {
  Function _fn,_callBack;
  String _logoUrl,_label;
  CustomLoginButton(this._fn,this._logoUrl,this._label,this._callBack);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide()),
      onPressed: () {
        Future<auth.User> future =_fn();
        this._callBack(future);

      },
      color: Colors.indigo.withOpacity(0.5),
      textColor: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Image(image: NetworkImage(_logoUrl),height: 40,width: 40, )),
          SizedBox(width: 25,),
          Text(_label.toUpperCase(),
              style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
  }

