import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final NicController nicLogic = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NIC Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIC Format: ${nicLogic.isNewFormat.value ? "New" : "Old"}', style: TextStyle(fontSize: 18)),
            Text('Birth Year: ${nicLogic.birthYear}', style: TextStyle(fontSize: 18)),
            Text('Date of Birth: ${nicLogic.birthDate}', style: TextStyle(fontSize: 18)),
            Text('Gender: ${nicLogic.gender}', style: TextStyle(fontSize: 18)),
            Text('Voting Eligibility: ${nicLogic.canVote.value ? "Can Vote" : "Cannot Vote"}', style: TextStyle(fontSize: 18)),
          ],
        )),
      ),
    );
  }
}