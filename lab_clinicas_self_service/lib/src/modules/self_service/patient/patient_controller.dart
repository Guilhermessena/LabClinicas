import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_self_service/src/repository/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  final PatientRepository _patientRepository;
  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  bool get nextStep => _nextStep();

  PatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  void goNextStep() {
    _nextStep.value = true;
  }

  Future<void> updateAndNext(PatientModel model) async {
    final updateResult = await _patientRepository.update(model);

    switch (updateResult) {
      case Left():
        showError('Erro ao atualizar dados do paciente, chame o atendente');
      case Right():
        showInfo('Paciente atualizado com sucesso');
        patient = model;
        goNextStep();
    }
  }

  Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _patientRepository.register(registerPatientModel);
    switch (result) {
      case Left():
        showError('Erro ao cadastrar o paciente, chame o atendente');
      case Right(value: final patient):
        showInfo('Paciente cadastrado com sucesso');
        this.patient = patient;
        goNextStep();
    }
  }
}
