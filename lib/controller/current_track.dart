import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/data/data.dart';

final currentTrackProvider = ChangeNotifierProvider<CurrentTrack>((ref) {
  return CurrentTrack();
});

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
