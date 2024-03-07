import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller.g.dart';

@riverpod
ScrollController scrollController(ScrollControllerRef ref) {
  return ScrollController();
}