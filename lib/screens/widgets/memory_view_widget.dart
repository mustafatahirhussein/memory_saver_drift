import 'dart:io';
import 'package:flutter/material.dart';
import 'package:memory_saver_drift/memorysaver.dart';

class MemoryViewWidget extends StatelessWidget {
  const MemoryViewWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MemorysaverData item;

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: Image.file(
              File(item.picture!),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            item.title!,
            style: style,
          ),
          Text(
            item.notes!,
            style: style.copyWith(letterSpacing: 1, fontSize: 14),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              item.memoryDt!,
              style: style.copyWith(fontSize: 11, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
