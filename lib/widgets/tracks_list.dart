import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/controller/current_track.dart';
import 'package:spotify/data/data.dart';

class TracksList extends ConsumerWidget {
  final List<Song> tracks;
  const TracksList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(currentTrackProvider);
    return DataTable(
      dataRowHeight: 54,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text("TITLE")),
        DataColumn(label: Text("ARTIST")),
        DataColumn(label: Text("ALBUM")),
        DataColumn(label: Icon(Icons.access_time))
      ],
      rows: tracks.map((e) {
        final selected = controller.selected?.id == e.id;
        final textStyle = TextStyle(
            color: selected
                ? Theme.of(context).accentColor
                : Theme.of(context).iconTheme.color);

        return DataRow(
            selected: selected,
            onSelectChanged: (_) => controller.selectTrack(e),
            cells: [
              DataCell(Text(
                e.title,
                style: textStyle,
              )),
              DataCell(Text(
                e.artist,
                style: textStyle,
              )),
              DataCell(Text(
                e.album,
                style: textStyle,
              )),
              DataCell(Text(
                e.duration,
                style: textStyle,
              ))
            ]);
      }).toList(),
    );
  }
}
