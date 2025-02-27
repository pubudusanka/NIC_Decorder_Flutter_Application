import 'package:get/get.dart';

class NicController extends GetxController {
  var isNewFormat = false.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var gender = ''.obs;
  var canVote = false.obs;

  void decodeNIC(String nic) {
    if (nic.length == 12) {
      isNewFormat.value = true;
      birthYear.value = nic.substring(0, 4);
      birthDate.value = calculateBirthDate(nic.substring(4, 7), birthYear.value);
      gender.value = calculateGender(nic.substring(7, 10));
      canVote.value = true;
    } else if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
      isNewFormat.value = false;
      birthYear.value = "19" + nic.substring(0, 2);
      birthDate.value = calculateBirthDate(nic.substring(2, 5), birthYear.value);
      gender.value = calculateGender(nic.substring(5, 8));
      canVote.value = true;
    } else {
      birthYear.value = 'Invalid NIC';
      birthDate.value = '';
      gender.value = '';
      canVote.value = false;
    }
  }

  String calculateBirthDate(String dayCode, String year) {
    int dayOfYear = int.tryParse(dayCode) ?? 0;
    if (dayOfYear > 500) {
      dayOfYear -= 500; // Female adjustment
    }
    DateTime birthDateComputed = DateTime(int.parse(year), 1, 1).add(Duration(days: dayOfYear - 1));
    String formattedDate = "${birthDateComputed.day}-${birthDateComputed.month}-${birthDateComputed.year}";
    birthDate.value = formattedDate;
    return formattedDate;
  }

  String calculateGender(String dayCode) {
    int dayOfYear = int.tryParse(dayCode) ?? 0;
    if (dayOfYear > 500) {
      return 'Female';
    } else {
      return 'Male';
    }
  }
}
