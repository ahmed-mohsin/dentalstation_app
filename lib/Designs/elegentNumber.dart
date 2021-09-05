import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:flutter/material.dart';

typedef void CounterChangeCallback(num value);

// ignore: must_be_immutable
class ElegantNumberButton extends StatelessWidget {
  final CounterChangeCallback onChanged;

  ElegantNumberButton({
    Key key,
     num initialValue,
    this.minValue,
    this.maxValue,
    this.onChanged,
    this.decimalPlaces,
    this.color,
    this.textStyle,
    this.step = 1,
    this.buttonSizeWidth = 30,
    this.buttonSizeHeight = 25,
  })  : assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(step > 0),
        selectedValue = initialValue,
        super(key: key);

  ///min value user can pick
  final num minValue;

  ///max value user can pick
  final num maxValue;

  /// decimal places required by the counter
  final int decimalPlaces;

  ///Currently selected integer value
  num selectedValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final num step;

  /// indicates the color of fab used for increment and decrement
  Color color;

  /// text syle
  TextStyle textStyle;

  final double buttonSizeWidth, buttonSizeHeight;

  void _incrementCounter() {
    if (selectedValue + step <= maxValue) {
      onChanged((selectedValue + step));
    }
  }

  void _decrementCounter() {
    if (selectedValue - step >= minValue) {
      onChanged((selectedValue - step));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return new Container(
      padding: new EdgeInsets.all(4.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: SizedBox(
              width: buttonSizeWidth,
              height: buttonSizeHeight,
              child: Container(
                child: Center(
                  child: Text(
                    '-',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: ShapeDecoration(
                    color: color == null ? themeData.accentColor : color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0)))),
              ),
            ),
            onTap: _decrementCounter,
          ),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: new Text(
                '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
                style: textStyle == null
                    ? textStyle
                    : new TextStyle(color: darkTeal,fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
          ),
          GestureDetector(
            child: SizedBox(
              width: buttonSizeWidth,
              height: buttonSizeHeight,
              child: Container(
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: ShapeDecoration(
                    color: color == null ? themeData.accentColor : color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
              ),
            ),
            onTap: _incrementCounter,
          ),
        ],
      ),
    );
  }
}
