import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Utils{

  static  showToast(BuildContext context, String mensagem) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black87,
        content: Container(
          color: Colors.transparent,
          height: 100,
          width: 100,
          child: Center(
            child: Text(mensagem),
          ),
        ),
      ),
    );
  }

  static logout()async{
    ParseUser currentUser = await  ParseUser.currentUser();
    var response = await currentUser.logout();

    if(response.success){
      Modular.to.navigate('/');
    }
  }
}