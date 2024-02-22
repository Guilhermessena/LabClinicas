import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_painel/src/pages/panel/widget/panel_principal_widget.dart';
import 'package:lab_clinicas_painel/src/pages/panel/widget/password_tile.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PanelPrincipalWidget(
                    passwordLabel: 'Senha anterior',
                    password: '01',
                    deskNumber: '09',
                    labelColor: LabClinicasTheme.orangeColor,
                    buttonColor: LabClinicasTheme.blueColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PanelPrincipalWidget(
                    passwordLabel: 'Chamando senha',
                    password: '01',
                    deskNumber: '09',
                    labelColor: LabClinicasTheme.blueColor,
                    buttonColor: LabClinicasTheme.orangeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: LabClinicasTheme.orangeColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Últimos chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
