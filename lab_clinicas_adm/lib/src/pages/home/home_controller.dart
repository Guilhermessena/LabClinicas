import 'package:asyncstate/asyncstate.dart' as asyncState;
import 'package:lab_clinicas_adm/src/model/patient_information_form_model.dart';
import 'package:lab_clinicas_adm/src/repository/attendant_desk_assignment.dart/attendant_desk_assignment_repository.dart';
import 'package:lab_clinicas_adm/src/service/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomeController with MessageStateMixin {
  HomeController(
      {required AttendantDeskAssignmentRepository attendantDeskRepository,
      required CallNextPatientService callNextPatientService})
      : _attendantDeskRepository = attendantDeskRepository,
        _callNextPatientService = callNextPatientService;
  final AttendantDeskAssignmentRepository _attendantDeskRepository;
  final CallNextPatientService _callNextPatientService;

  final _informationForm = signal<PatientInformationFormModel?>(null);

  PatientInformationFormModel? get informationForm => _informationForm();

  Future<void> startService(int deskNumber) async {
    asyncState.AsyncState.show();
    final result = await _attendantDeskRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asyncState.AsyncState.hide();
        showError('Erro ao iniciar guichê');
      case Right():
        final resultNextPatient = await _callNextPatientService.execute();
        switch (resultNextPatient) {
          case Left():
            showError('Erro ao chamar o próximo paciente');
          case Right(value: final form?):
            asyncState.AsyncState.hide();
            _informationForm.value = form;
          case Right(value: _):
            asyncState.AsyncState.hide();
            showInfo('Nenhum paciente aguardando');
        }
    }
  }
}
