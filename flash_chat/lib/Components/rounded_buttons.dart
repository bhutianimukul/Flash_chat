
import 'package:flutter/material.dart';

class UiButtons extends StatelessWidget {
  final Color color;
  final String text;
  final Function fn;

  const UiButtons({ this.color, this.text, this.fn}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: color,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: fn,
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    text,
                  ),
                ),
              ),
            );
  }
}