import 'dart:io';

import 'package:drift/drift.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_saver_drift/date_extension.dart';
import 'package:memory_saver_drift/main.dart';
import 'package:memory_saver_drift/memorysaver.dart';

class AddNewMemory extends StatefulWidget {
  const AddNewMemory({Key? key}) : super(key: key);

  @override
  State<AddNewMemory> createState() => _AddNewMemoryState();
}

class _AddNewMemoryState extends State<AddNewMemory> {
  File? image;

  dynamic attachImage() async {
    PickedFile? pf = await ImagePicker().getImage(source: ImageSource.camera);

    if(pf != null) {
      setState(() {
        image = File(pf.path);
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No image attached"),));
    }
  }

  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _memoryDateC = TextEditingController();
  final TextEditingController _notesC = TextEditingController();
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shrinkWrap: true,
              children: [

                InkWell(
                  onTap: () => attachImage(),
                  child: image == null ? Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.picture_in_picture_alt_outlined, color: Colors.white, size: 50,),
                    ),
                  ) : SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(image!.path), fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                getField(_titleC, 'Name your memory...'),
                getField(_memoryDateC, 'Happened on...', onTap: () => datePicker(), readOnly: true),
                getField(_notesC, 'Something you would like to add extra...', onTap: () {}, lines: 5),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              child: ElevatedButton(
                child: const Text("Add new memory"),
                onPressed: () {

                  MemorysaverCompanion model = MemorysaverCompanion(
                    title: d.Value(_titleC.text),
                    memoryDt: d.Value(_memoryDateC.text),
                    picture: d.Value(image!.path),
                    notes: d.Value(_notesC.text),
                  );

                  memoryDb!.saveMemory(model);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getField(TextEditingController controller, String hint, {VoidCallback? onTap, bool readOnly = false, int? lines}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        maxLines: lines,
        readOnly: readOnly,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14)
          )
        ),
        onTap: onTap,
      ),
    );
  }

  Future<dynamic> datePicker() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        final size = MediaQuery.of(context).size;
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          height: size.height * 0.27,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              DateTime dt = value;
              _memoryDateC.text = dt.formatter;
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
