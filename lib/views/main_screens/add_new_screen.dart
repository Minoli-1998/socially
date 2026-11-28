import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socially_app/utils/functions/mood.dart';
import 'package:socially_app/widgets/reusable/custom_button.dart';
import 'package:socially_app/widgets/reusable/custom_input.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  // fields
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _captionController = TextEditingController();
  File? _imageFile;
  Mood _selectedMood = Mood.happy;
  bool _isUploading = false;

  // pick an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    controller: _captionController,
                    labelText: "Caption",
                    icon: Icons.text_fields,
                    textInputType: TextInputType.text,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the caption for the post";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // mood selector
                  DropdownButton<Mood>(
                    value: _selectedMood,
                    items: Mood.values.map((Mood mood) {
                      return DropdownMenuItem(
                        value: mood,
                        child: Text("${mood.name} ${mood.emoji}"),
                      );
                    }).toList(),
                    onChanged: (Mood? newMood) {
                      setState(() {
                        _selectedMood = newMood ?? _selectedMood;
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: kIsWeb
                              ? Image.network(_imageFile!.path)
                              : Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                        )
                      : Text("No image selected"),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCustomButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        text: "Use Camera",
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),

                      AppCustomButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        text: "Use Gallery",
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  AppCustomButton(
                    onPressed: () {
                      // todo: submit post
                    },
                    text: kIsWeb ? "Not supported yet" : "Create Post",
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
