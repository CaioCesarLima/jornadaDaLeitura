import 'package:flutter/material.dart';

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
}