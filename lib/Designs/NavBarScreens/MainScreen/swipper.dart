import 'package:custom_timer/custom_timer.dart';
import 'package:dentalstation_app/Designs/ProductDetailsScreen.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../productsjson.dart';

class SwipperSection extends StatefulWidget {
  @override
  _SwipperSectionState createState() => _SwipperSectionState();
}

class _SwipperSectionState extends State<SwipperSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: FlipClock.countdown(
            duration: productList[0]['willEnd'].difference(DateTime.now()),
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 30.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            onDone: () => print('ih'),
          ),
        ),
        Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                print('clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(
                            productList[index]['name'], index)));
              },
              child: Card(
                child: Stack(
                  children: <Widget>[
                    SizedBox.expand(
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(productList[index]['image'],
                            width: 200, fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox.expand(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          color: Colors.redAccent,
                          child: Text(
                              '${(productList[index]['price'] / productList[index]['oldPrice'] * 100).round()}% OFF',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(productList[index]['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('you will save ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            '${(productList[index]['oldPrice'] - productList[index]['price']).round()}' +
                                                ' EGP',
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            );
            /*formatDuration(productList[index]['willEnd']
                                        .difference(DateTime.now()))*/
          },
          itemCount: 10,
          itemHeight: 250,
          itemWidth: 400,
          layout: SwiperLayout.TINDER,
        ),
      ],
    );
  }

  static String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(':');
  }
}
