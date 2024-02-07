import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/binding/lab_clinicas_application_binding.dart';
import 'package:lab_clinicas_self_service/src/modules/auth/auth_module.dart';
import 'package:lab_clinicas_self_service/src/modules/home/home_module.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_module.dart';
import 'package:lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';

late List<CameraDescription> _cameras;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();

    runApp(const LabClinicasSelfService());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasSelfService extends StatelessWidget {
  const LabClinicasSelfService({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas Auto Atendimento',
      binding: LabClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (context) => const SplashPage(),
          path: '/',
        )
      ],
      modules: [
        AuthModule(),
        HomeModule(),
        SelfServiceModule(),
      ],
      didStart: () {
        FlutterGetItBindingRegister.registerPermanentBinding(
          'CAMERAS',
          [
            Bind.lazySingleton((i) => _cameras),
          ],
        );
      },
    );
  }
}
