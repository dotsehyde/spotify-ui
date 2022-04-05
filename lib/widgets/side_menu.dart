import 'package:flutter/material.dart';

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
          ListTile(
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(
              Icons.home,
              size: 28,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
    );
  }
}
