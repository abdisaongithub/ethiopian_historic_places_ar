import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  static String id = 'HelpScreen';

  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.black45,
                    thickness: 2,
                  ),
                ),
                const Center(
                  child: Text(
                    'Lorem ipsum is simply dummy text of the printing and typesetting industry. '
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                    'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                    '\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, '
                    'remaining essentially unchanged. It was popularised in the 1960s with the release of '
                    'Lettres sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
                    'software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
