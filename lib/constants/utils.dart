import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (files?.files.isNotEmpty ?? false) {
      for (var image in files!.files) {
        images.add(File(image.path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
