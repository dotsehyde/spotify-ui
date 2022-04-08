import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/controller/current_track.dart';
import 'package:spotify/data/data.dart';

class PlaylistHeader extends ConsumerWidget {
  final Playlist playlist;
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(currentTrackProvider);
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selected != null ? 'NOW PLAYING' : 'PLAYLIST',
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12),
                ),
                const SizedBox(height: 12),
                Text(
                  controller.selected?.title ?? playlist.name,
                  style: Theme.of(context).textTheme.headline2!,
                ),
                const SizedBox(height: 16),
                Text(
                  controller.selected?.artist ?? playlist.description,
                  style: Theme.of(context).textTheme.subtitle1!,
                ),
                const SizedBox(height: 16),
                Text(
                  'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                  style: Theme.of(context).textTheme.subtitle1!,
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 20),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends ConsumerWidget {
  final String followers;
  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Theme.of(context).accentColor,
                primary: Theme.of(context).iconTheme.color,
                textStyle: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(letterSpacing: 2, fontSize: 12)),
            onPressed: () {
              ref.read(currentTrackProvider).selectTrack(lofihiphopMusic[0]);
            },
            child: const Text("PLAY")),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30,
        ),
        const Spacer(),
        Text("FOLLOWERS\n$followers",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12))
      ],
    );
  }
}
