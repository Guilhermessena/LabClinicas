import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_painel/src/pages/panel/panel_page.dart';

class PanelRouter extends FlutterGetItPageRouter {
  const PanelRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/panel';

  @override
  WidgetBuilder get view => (context) => const PanelPage();
}
