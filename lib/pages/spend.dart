import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Spend extends StatefulWidget {
  @override
  SpendState createState() => SpendState();
}

//class controller
class SpendState extends State<Spend> {
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    // if (item != null) {
    //   priceController.text = item!.price.toString();
    //   descriptionController.text = item!.description;
    // }
    //rubah
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengeluaran'),
      ),
      body: Stack(
        // scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Tanggal:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                ),
                child: Container(
                  // padding: EdgeInsets.all(5),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //   color: Colors.black,
                  // )),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      // labelText: "Tanggal",
                      suffixIcon: Icon(Icons.calendar_month_rounded),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Nominal:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  // decoration: InputDecoration(
                  //   // labelText: 'Amount',
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  // ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Keterangan:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  // decoration: InputDecoration(
                  //   // labelText: 'Amount',
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  // ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                    shadowColor: Color(
                      0xFF000000,
                    ),
                    primary: Colors.orange,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      40,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                    shadowColor: Color(
                      0xFF000000,
                    ),
                    primary: Colors.green[100],
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      40,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                    shadowColor: Color(
                      0xFF000000,
                    ),
                    primary: Colors.blue,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      40,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    '<< Kembali',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //     body: Padding(
      //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      //   child: ListView(
      //     children: <Widget>[
      //       Container(
      //         padding: const EdgeInsets.all(12),
      //         margin: const EdgeInsets.only(),
      //         child: TextField(
      //           controller: dateController,
      //           decoration: InputDecoration(
      //             labelText: "Tanggal",
      //             icon: Icon(
      //               Icons.calendar_today_rounded,
      //             ),
      //           ),
      //           onTap: () async {
      //             DateTime? pickeddate = await showDatePicker(
      //               context: context,
      //               initialDate: DateTime.now(),
      //               firstDate: DateTime(2000),
      //               lastDate: DateTime(2101),
      //             );
      //             if (pickeddate != null) {
      //               setState(() {
      //                 dateController.text =
      //                     DateFormat('yyyy-MM-dd').format(pickeddate);
      //               });
      //             }
      //           },
      //         ),
      //       ),
      //       // nama
      //       Padding(
      //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      //         child: TextField(
      //           controller: priceController,
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             labelText: 'Amount',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //           ),
      //           onChanged: (value) {
      //             //
      //           },
      //         ),
      //       ),
      //       // stock
      //       Padding(
      //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      //         child: TextField(
      //           controller: descriptionController,
      //           keyboardType: TextInputType.text,
      //           decoration: InputDecoration(
      //             labelText: 'description',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //           ),
      //           onChanged: (value) {
      //             //
      //           },
      //         ),
      //       ),
      //       // tombol button
      //       Padding(
      //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      //         child: Row(
      //           children: <Widget>[
      //             // tombol simpan
      //             Expanded(
      //               child: ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                     backgroundColor: Theme.of(context).primaryColorDark,
      //                     textStyle: TextStyle(
      //                         color: Theme.of(context).primaryColorLight)),
      //                 child: Text(
      //                   'Save',
      //                   textScaleFactor: 1.5,
      //                 ),
      //                 onPressed: () {
      //                   // if (item == null) {
      //                   //   // tambah data
      //                   //   item = Item(
      //                   //     int.parse(priceController.text),
      //                   //     descriptionController.text,
      //                   //   );
      //                   // } else {
      //                   //   // ubah data
      //                   //   item?.price = int.parse(priceController.text);
      //                   //   item?.description = descriptionController.text;
      //                   // }
      //                   // kembali ke layar sebelumnya dengan membawa objek item
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //             ),
      //             Container(
      //               width: 5.0,
      //             ),
      //             // tombol batal
      //             Expanded(
      //               child: ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                     backgroundColor: Theme.of(context).primaryColorDark,
      //                     textStyle: TextStyle(
      //                         color: Theme.of(context).primaryColorLight)),
      //                 child: Text(
      //                   'Cancel',
      //                   textScaleFactor: 1.5,
      //                 ),
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ));
    );
  }
}
