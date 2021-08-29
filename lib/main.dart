import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  await Parse().initialize('hcR53CCvX8mHHzT7yW9UISY2EzDQm3O7KXjO9ycj',
      'https://parseapi.back4app.com/',
      clientKey: 'h7Y3hYGfrCTSn7LhukOrBWnxyuPRUmQT1L1glAhi');
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
