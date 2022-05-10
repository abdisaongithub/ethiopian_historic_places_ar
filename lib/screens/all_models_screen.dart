import 'package:flutter/material.dart';

class AllModelsScreen extends StatefulWidget {
  static String id = 'AllModelsScreen';
  const AllModelsScreen({Key? key}) : super(key: key);

  @override
  _AllModelsScreenState createState() => _AllModelsScreenState();
}

class _AllModelsScreenState extends State<AllModelsScreen> {
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
                      'All Models',
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
                // TODO: List all available models right here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
