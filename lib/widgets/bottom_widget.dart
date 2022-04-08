import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/controller/current_track.dart';

class BottomWidget extends ConsumerWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black54,
      width: double.infinity,
      height: 84,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const _TrackInfo(),
          const Spacer(),
          const _PlayerControls(),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 800) const _MoreControls()
        ],
      ),
    );
  }
}

class _TrackInfo extends ConsumerWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(currentTrackProvider).selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          "assets/lofigirl.jpg",
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey[300], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 12),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
      ],
    );
  }
}

class _PlayerControls extends ConsumerWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(currentTrackProvider).selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20,
                onPressed: () {},
                icon: const Icon(Icons.shuffle)),
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 20,
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_outlined),
            ),
            IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 34,
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline)),
            IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20,
                onPressed: () {},
                icon: const Icon(Icons.skip_next_outlined)),
            IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20,
                onPressed: () {},
                icon: const Icon(Icons.repeat))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "0:00",
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(width: 8),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            const SizedBox(width: 8),
            Text(
              selected?.duration ?? "0:00",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )
      ],
    );
  }
}

class _MoreControls extends ConsumerWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          iconSize: 20,
          icon: const Icon(Icons.devices_outlined),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          iconSize: 20,
          icon: const Icon(Icons.fullscreen_outlined),
        ),
      ],
    );
  }
}
