import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'result_screen.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();
  final NicController nicLogic = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NIC Decoder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nicController,
              decoration: const InputDecoration(
                labelText: 'Enter NIC Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                nicLogic.decodeNIC(nicController.text);
                Get.to(() => ResultScreen());
              },
              child: const Text('Decode'),
            ),
          ],
        ),
      ),
    );
  }
}
