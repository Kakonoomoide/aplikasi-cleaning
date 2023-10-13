import 'package:flutter/material.dart';
import 'package:final_project_2023/app/modules/list/views/list_view.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Rekapan extends StatefulWidget {
  const Rekapan({super.key});

  @override
  State<Rekapan> createState() => _RekapanState();
}

class _RekapanState extends State<Rekapan> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _bulan;
  late String _tanggal;
  late String _berat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rekapan perbulan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 113, 173, 115),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Bulan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.calendar_month),
                      ),
                      onSaved: (value) => _bulan = value!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Tanggal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      onSaved: (value) => _tanggal = value!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Berat',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.local_offer),
                      ),
                      onSaved: (value) => _berat = value!,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await FirebaseFirestore.instance
                            .collection('form')
                            .add({
                          'Bulan': _bulan,
                          'Tanggal': _tanggal,
                          'Berat': _berat,
                        });
                        Get.snackbar('Berhasil', 'Data berhasil disimpan',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color.fromARGB(133, 79, 154, 82));
                        Get.off(Rekapan());
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 74, 145, 76),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(double.maxFinite, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3, color: Color.fromARGB(168, 76, 175, 79)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('form').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot card = snapshot.data!.docs[index];
                      return DropDownCard(
                        title: card['Bulan'],
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Tanggal: ${card['Tanggal']}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Berat ${card['Berat']}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DropDownCard extends StatefulWidget {
  final String title;
  final Widget child;

  DropDownCard({super.key, required this.title, required this.child});

  @override
  _DropDownCardState createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isExpanded ? Colors.green : Colors.grey,
            width: 2,
          ),
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: widget.child,
            )
          ],
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
        ),
      ),
    );
  }
}
