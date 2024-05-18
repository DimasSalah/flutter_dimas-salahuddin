import 'package:flutter/material.dart';
import 'package:prioritas_1/screens/contact/components/drawer_sidebar.dart';

class GalleryView extends StatelessWidget {
  GalleryView({super.key});

  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const DrawerSideBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing:5,
          mainAxisSpacing: 5,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      children: [
                        Image.asset(images[index], width: 200,),
                        const SizedBox(height: 10),
                        Text(
                          'lihat lebih detail gambar ke ${index + 1}?',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/detail', arguments: images[index]);
                              },
                              child: const Text('ya',style: TextStyle(color: Colors.white),),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('tidak',style: TextStyle(color: Colors.white),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Image.asset(images[index]),
          ); // Displaying icons
        },
      ),
    );
  }
}
