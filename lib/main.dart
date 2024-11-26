import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller de FlutterWeb',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const SideHustleScreen(),
    );
  }
}

class SideHustleScreen extends StatelessWidget {
  const SideHustleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Side Hustle',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
            Spacer(),
            Row(
              children: [
                Icon(Icons.share, color: Colors.black, size: 18),
                SizedBox(width: 8),
                Text(
                  'Share',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(width: 16),
                Icon(Icons.more_horiz, color: Colors.black),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                botonConIcono(
                  label: 'Projects',
                  icon: FontAwesomeIcons.folderOpen,
                  onTap: () {},
                ),
                botonConIcono(
                  label: 'Drafts',
                  icon: FontAwesomeIcons.fileAlt,
                  onTap: () {},
                ),
                botonConIcono(
                  label: 'Shared With Me',
                  icon: FontAwesomeIcons.users,
                  onTap: () {},
                ),
                const Spacer(),
                botonConIcono(
                  label: 'Settings',
                  icon: FontAwesomeIcons.cogs,
                  onTap: () {},
                ),
                botonConIcono(
                  label: 'Invite Members',
                  icon: FontAwesomeIcons.userPlus,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                botonConIcono(
                  label: 'New Draft',
                  icon: FontAwesomeIcons.plus,
                  onTap: () {},
                ),
                botonConIcono(
                  label: 'New Project',
                  icon: FontAwesomeIcons.plusCircle,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      _CategoryCard(
                        title: 'Ideas',
                        color: Colors.blue,
                        items: [
                          'Design Moodboard',
                          'Product Ideas',
                          'Feature Ideas',
                          'Research Findings',
                        ],
                      ),
                      SizedBox(width: 16),
                      _CategoryCard(
                        title: 'Work in Progress',
                        color: Colors.green,
                        items: [
                          'API Design',
                          'Hi-Fi Prototypes',
                          'Edge Case Designs',
                        ],
                      ),
                      SizedBox(width: 16),
                      _CategoryCard(
                        title: 'Done',
                        color: Colors.orange,
                        items: [
                          'Information Architecture',
                          'Code Convention',
                          'Competitor Analysis',
                          'Wireframes',
                        ],
                      ),
                      SizedBox(width: 16),
                      _CategoryCard(
                        title: 'Goals',
                        color: Colors.red,
                        items: [
                          'MVP',
                          'Launch Plans',
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botonConIcono({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final List<String> items;
  final Color color;

  const _CategoryCard({
    required this.title,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título con círculo de color
              Row(
                children: [
                  CircleAvatar(radius: 5, backgroundColor: color),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...items.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(item),
                  )),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8.0),
                child: const Text(
                  'Editar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 163, 164, 165),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
