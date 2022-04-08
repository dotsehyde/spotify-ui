import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      width: 280,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/spotify_logo.png",
                  height: 55,
                  filterQuality: FilterQuality.high,
                ),
              ],
            ),
          ),
          _SideMenuItem(
            icon: Icons.home,
            text: "Home",
            onTap: () {},
          ),
          _SideMenuItem(
            icon: Icons.search,
            text: "Search",
            onTap: () {},
          ),
          _SideMenuItem(
            icon: Icons.audiotrack,
            text: "Radio",
            onTap: () {},
          ),
          const SizedBox(height: 12),
          const _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const _SideMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(
        icon,
        size: 28,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylist extends StatelessWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((e) {
                  return ListTile(
                      onTap: () {},
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ));
                }).toList()
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) {
                  return ListTile(
                      onTap: () {},
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ));
                }).toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
