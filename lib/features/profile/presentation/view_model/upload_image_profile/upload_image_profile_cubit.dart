 import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_profile_state.dart';

class UploadImageProfileCubit extends Cubit<UploadImageProfileState> {
  UploadImageProfileCubit() : super(UploadImageProfileInitial());

  static UploadImageProfileCubit get(context) => BlocProvider.of(context);

  final picker = ImagePicker();


  Future<void> pickImage(File? image) async {
    emit(UploadImageLoadingState());
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(UploadImageSuccessState(image: image));
    }
  }

  // Future uploadImage() async {
  //   emit(UploadImageLoadingState());
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowedExtensions: ["jpg", "png", "jpeg"],
  //     type: FileType.custom,
  //   );
  //   AppConstants.file = File(result?.files.first.path ?? "");
  //   print(result!.files.first.path);
  //   print("---------- uplod is done ------------");
  //   emit(UploadImageSuccessState());
  // }

}
