import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: const Icon(
                  Icons.chevron_left,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 28,
                ),
              ),
            ),
          ]),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: const Text("Username")),
          const SizedBox(width: 8),
          IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_rounded)),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
            const Color(0xFFAf1018),
            Theme.of(context).backgroundColor,
          ],
                  stops: const [
            0,
            0.3
          ]))),
    );
  }
}
