

import 'package:flutter/material.dart';
import 'package:rest_api/views/prioritas1/prioritas1_view.dart';
import 'package:rest_api/views/prioritas2_eksplorasi/eksplorasi_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            ListTile(
              title: Text('Prioritas 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Prioritas1View(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Prioritas 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EksplorasiView(),
                  ),
                );
              },
            ),
          ],
        )
      ),
    );
  }
}
