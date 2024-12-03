import 'package:flutter/material.dart';
import '../pages/Dashboard.dart';
import '../pages/DepartmentSelection.dart';
import '../pages/Details.dart';
import '../pages/HospitalNva.dart';
import '../pages/MedicalScience.dart';
import '../pages/MedicalVideo.dart';
import '../pages/SymptomCheck.dart';
import '../pages/TreatmentItems.dart';
import '../pages/TriageResults.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String departmentSelection = '/departmentSelection';
  static const String details = '/details';
  static const String hospitalNva = '/hospitalNva';
  static const String medicalScience = '/medicalScience';
  static const String medicalVideo = '/medicalVideo';
  static const String symptomCheck = '/symptomCheck';
  static const String treatmentItems = '/treatmentItems';
  static const String triageResults = '/triageResults';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      dashboard: (context) => DashboardPage(),
      departmentSelection: (context) => DepartmentSelectionPage(),
      details: (context) => DetailsPage(),
      hospitalNva: (context) => HospitalNvaPage(),
      medicalScience: (context) => MedicalSciencePage(),
      medicalVideo: (context) => MedicalVideoPage(),
      symptomCheck: (context) => SymptomCheckPage(),
      treatmentItems: (context) => TreatmentItemsPage(),
      triageResults: (context) => TriageResultsPage(),
    };
  }
}