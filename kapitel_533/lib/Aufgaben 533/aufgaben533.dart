import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const Aufgaben533());
}

class Aufgaben533 extends StatefulWidget {
  const Aufgaben533({super.key});
  @override
  State<Aufgaben533> createState() => _Aufgaben533State();
}

class _Aufgaben533State extends State<Aufgaben533> {
  List<File> images = [];
  pickImage(ImageSource src) async {
    try {
     int result;
for (int i = 10; i >= 0; i--) {
result = 10 ~/ i;
print(result);
}
      final pickedImage = await ImagePicker().pickImage(source: src);
    setState(() {
      imagePath = pickedImage?.path ?? '';
      images.add(File(imagePath));
    });
    }
    catch (error){
    print("Hallo"+error.toString());
    }
    
  }
  

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aufgabe1'),
        ),
        body: Column(
          children: [
            MaterialButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: const Text('Kamera')),
            const SizedBox(width: 32),
            MaterialButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                child: const Text('Galerie')),
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _removeImage(index),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.file(images[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
