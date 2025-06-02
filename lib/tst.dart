import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tst extends StatefulWidget {
  const Tst({super.key});

  @override
  State<Tst> createState() => _TstState();
}

class _TstState extends State<Tst> {
  String selectedValue = 'AM';
  void toggleValue() {
    setState(() {
      selectedValue = selectedValue == 'AM' ? 'PM' : 'AM';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            // padding: EdgeInsets.all(4),
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),

            child: GestureDetector(
              onTap: () => toggleValue(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 0,
                    color:
                        selectedValue == 'AM'
                            ? Colors.white
                            : Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2,
                      ),
                      child: Text('AM'),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color:
                        selectedValue == 'PM'
                            ? Colors.white
                            : Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2,
                      ),
                      child: Text('PM'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
