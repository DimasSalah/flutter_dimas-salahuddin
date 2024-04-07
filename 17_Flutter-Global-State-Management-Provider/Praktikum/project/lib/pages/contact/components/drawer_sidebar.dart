import 'package:flutter/material.dart';

class DrawerSideBar extends StatelessWidget {
  const DrawerSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text('Contact'),
                  onTap: () {
                    if (ModalRoute.of(context)?.settings.name == '/contact') {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () {
                    if (ModalRoute.of(context)?.settings.name == '/gallery') {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/gallery');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
