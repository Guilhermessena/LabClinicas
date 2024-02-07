import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';

class LabClinicasSelfServiceAppbar extends LabClinicasAppBar {
  LabClinicasSelfServiceAppbar({super.key})
      : super(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Reinicar processo'),
                  ),
                ];
              },
              onSelected: (value) async {
                Injector.get<SelfServiceController>().restartProcess();
              },
            )
          ],
        );
}
