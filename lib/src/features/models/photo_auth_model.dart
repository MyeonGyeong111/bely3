
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PhotoAuthModel{
  RxString? image;
  Rx<FileImage>? imageFile;
  RxBool me;
  RxString writer;
  RxString date;
  RxInt warning;
  RxInt like;

  PhotoAuthModel({
    this.image,
    this.imageFile,
    required this.me,
    required this.writer,
    required this.date,
    required this.warning,
    required this.like,
  });
}