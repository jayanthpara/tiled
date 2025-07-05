import 'package:flutter/material.dart';

class TileGridScreen extends StatefulWidget {
  final int rows;
  final int cols;

  TileGridScreen({required this.rows, required this.cols});

  @override
  _TileGridScreenState createState() => _TileGridScreenState();
}

class _TileGridScreenState extends State<TileGridScreen> {
  late List<bool> tileStates;

  @override
  void initState() {
    super.initState();
    tileStates = List<bool>.filled(widget.rows * widget.cols, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.rows} x ${widget.cols} Grid'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.cols,
        ),
        itemCount: tileStates.length,
        itemBuilder: (_, index) {
          final isActive = tileStates[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                tileStates[index] = !isActive;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF00B4D8) : Color(0xFFE0E0E0),
              ),
            ),
          );
        },
      ),
    );
  }
}
