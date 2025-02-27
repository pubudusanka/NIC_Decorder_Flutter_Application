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
      canVote.value = true;
    } else if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
      isNewFormat.value = false;
      birthYear.value = "19" + nic.substring(0, 2);
      canVote.value = nic.endsWith('V');
    } else {
      birthYear.value = 'Invalid NIC';
      birthDate.value = '';
      gender.value = '';
      canVote.value = false;
    }
  }
}