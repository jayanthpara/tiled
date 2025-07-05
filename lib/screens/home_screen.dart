import 'package:flutter/material.dart';
import 'tile_grid_screen.dart'; // Make sure this path is correct based on your folder structure

class HomeScreen extends StatelessWidget {
  final List<Map<String, int>> options = [
    {'rows': 3, 'cols': 9},
    {'rows': 5, 'cols': 14},
    {'rows': 8, 'cols': 32},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Grid Size')),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (_, i) {
          final opt = options[i];
          return ListTile(
            title: Text('${opt['rows']} x ${opt['cols']} Grid'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TileGridScreen(
                    rows: opt['rows']!,
                    cols: opt['cols']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
