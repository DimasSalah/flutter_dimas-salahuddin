import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rest_api/views/prioritas1/component/custom_drawer.dart';

import '../../data/api/image_service.dart';

class EksplorasiView extends StatefulWidget {
  const EksplorasiView({super.key});

  @override
  State<EksplorasiView> createState() => _EksplorasiViewState();
}

class _EksplorasiViewState extends State<EksplorasiView> {
  TextEditingController nameController = TextEditingController();
  String _imageUrl = '';
  String selectedAvatarType = 'adventurer-neutral';
  List<String> dropdownItems = [
    'adventurer-neutral',
    'thumbs',
    'initials',
    'bottts-neutral',
  ];

  Future<void> _getImageUrl() async {
    String seed = nameController.text;
    String style = selectedAvatarType;
    final response = await ImageService.imageUrl(style, seed);
    setState(() {
      _imageUrl = response.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Image Profile Generator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipOval(
                child: _imageUrl.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 50,
                      )
                    : SvgPicture.string(
                        _imageUrl,
                      ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<String>(
                    value: selectedAvatarType,
                    onChanged: (String? value) {
                      setState(() {
                        selectedAvatarType = value!;
                      });
                    },
                    items: dropdownItems
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                onPressed: () {
                  _getImageUrl();
                },
                child: const Text(
                  'Generate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
