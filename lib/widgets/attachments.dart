import 'package:flutter/material.dart';

class Attachments extends StatefulWidget {
  const Attachments({Key? key}) : super(key: key);

  @override
  _AttachmentsState createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  iconGen(
                      const Icon(
                        Icons.insert_drive_file,
                        color: Colors.white,
                      ),
                      Colors.indigo,
                      'Documents'),
                  iconGen(const Icon(Icons.camera_alt, color: Colors.white),
                      Colors.pink, 'Camera'),
                  iconGen(const Icon(Icons.image_sharp, color: Colors.white),
                      Colors.purple, 'Gallery')
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                iconGen(const Icon(Icons.headset, color: Colors.white),
                    Colors.orange, 'Audio'),
                iconGen(const Icon(Icons.location_on, color: Colors.white),
                    Colors.teal, 'Location'),
                iconGen(const Icon(Icons.person, color: Colors.white),
                    Colors.blue, 'Contacts'),
              ], mainAxisAlignment: MainAxisAlignment.spaceAround),
            ],
          ),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}

Widget iconGen(Icon icon, Color color, String text) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Container(
              child: icon,
              // decoration: BoxDecoration(shape: BoxShape.circle,
              // gradient: LinearGradient(colors: [])),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 13),
        )
      ],
    ),
  );
}
