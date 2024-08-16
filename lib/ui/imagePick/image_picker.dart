import 'dart:io';
import 'package:blockprec/bloc/imageupload/image_picker_block.dart';
import 'package:blockprec/bloc/imageupload/image_picker_event.dart';
import 'package:blockprec/bloc/imageupload/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Image"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(30),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BlocBuilder<ImagePickerBlock, ImagePickerState>(
              builder: (context, state) {
                return state.file == null
                    ? SizedBox()
                    : Container(
                        height: 200,
                        width: 300,
                        child: Image.file(
                          File(
                            state.file!.path.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      );
              },
            ),
          ),
          Gap(10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ImagePickerBlock>().add(CamersPickerEvent());
                },
                child: Icon(
                  Icons.camera,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              Gap(50),
              GestureDetector(
                onTap: () {
                  context.read<ImagePickerBlock>().add(GalleryPickerEvent());
                },
                child: Icon(
                  Icons.album,
                  color: Colors.blue,
                  size: 50,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
