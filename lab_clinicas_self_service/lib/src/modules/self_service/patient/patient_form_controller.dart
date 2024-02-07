import 'package:flutter/material.dart';
import 'package:lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:lab_clinicas_self_service/src/repository/patients/patient_repository.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneNumberEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetAddressEC = TextEditingController();
  final numberEC = TextEditingController();
  final addressComplementEC = TextEditingController();
  final stateAddressEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose;
    emailEC.dispose;
    phoneNumberEC.dispose;
    documentEC.dispose;
    cepEC.dispose;
    streetAddressEC.dispose;
    numberEC.dispose;
    addressComplementEC.dispose;
    stateAddressEC.dispose;
    cityEC.dispose;
    districtEC.dispose;
    guardianEC.dispose;
    guardianIdentificationNumberEC.dispose;
  }

  void initializeForm(final PatientModel? patient) {
    if (patient != null) {
      nameEC.text = patient.name;
      emailEC.text = patient.email;
      phoneNumberEC.text = patient.phoneNumber;
      documentEC.text = patient.document;
      cepEC.text = patient.address.cep;
      streetAddressEC.text = patient.address.streetAddress;
      numberEC.text = patient.address.number;
      addressComplementEC.text = patient.address.addressComplement;
      stateAddressEC.text = patient.address.streetAddress;
      cityEC.text = patient.address.city;
      districtEC.text = patient.address.district;
      guardianEC.text = patient.guardian;
      guardianIdentificationNumberEC.text =
          patient.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneNumberEC.text,
      document: documentEC.text,
      address: patient.address.copyWith(
        cep: cepEC.text,
        streetAddress: streetAddressEC.text,
        number: numberEC.text,
        addressComplement: addressComplementEC.text,
        state: stateAddressEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }

  RegisterPatientModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneNumberEC.text,
      document: documentEC.text,
      address: (
        cep: cepEC.text,
        streetAddress: streetAddressEC.text,
        number: numberEC.text,
        addressComplement: addressComplementEC.text,
        state: stateAddressEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }
}
