import 'package:blockprec/bloc/imageupload/image_picker_event.dart';
import 'package:blockprec/bloc/imageupload/image_picker_state.dart';
import 'package:blockprec/utils/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBlock extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePic imagePic;

  ImagePickerBlock(this.imagePic) : super(ImagePickerState()) {
    on<CamersPickerEvent>(camerapic);
    on<GalleryPickerEvent>(gallerypic);
  }

  void camerapic(
      CamersPickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await ImagePic().cameraImage();
    emit(state.copyWith(file: file));
  }

  void gallerypic(
      GalleryPickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await ImagePic().galleryImage();
    emit(state.copyWith(file: file));
  }
}
