import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
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
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                ModelButton(
                  label: 'Adama',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ModelViewerScreen.id,
                      arguments: ModelViewerScreenArgument(
                        alt: 'adama',
                        source: 'assets/ar/adama.glb',
                      ),
                    );
                  },
                ),
                ModelButton(
                  label: 'Axum',
                  iconData: Icons.remove_red_eye_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ModelViewerScreen.id,
                      arguments: ModelViewerScreenArgument(
                        alt: 'axum',
                        source: 'assets/ar/axum.glb',
                      ),
                    );
                  },
                ),
                ModelButton(
                  label: 'Lalibela',
                  iconData: Icons.remove_red_eye_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ModelViewerScreen.id,
                      arguments: ModelViewerScreenArgument(
                        alt: 'adama',
                        source: 'assets/ar/lalibela.glb',
                      ),
                    );
                  },
                ),
                ModelButton(
                  label: 'Sheger',
                  iconData: Icons.remove_red_eye_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ModelViewerScreen.id,
                      arguments: ModelViewerScreenArgument(
                        alt: 'sheger',
                        source: 'assets/ar/ja.glb',
                      ),
                    );
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

class ModelButton extends StatelessWidget {
  const ModelButton({
    Key? key,
    required this.label,
    this.iconData = Icons.remove_red_eye_outlined,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.75),
            width: 2,
            style: BorderStyle.solid,
          ),
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(4),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
