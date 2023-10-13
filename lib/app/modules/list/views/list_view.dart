import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class ListRekap extends GetView<ListController> {
  const ListRekap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
