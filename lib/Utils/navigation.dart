import 'package:flutter/material.dart';

navigateAndKeepStack(BuildContext context, Widget targetRoute) =>


    Navigator.push(
      context,
      MaterialPageRoute(
        // CustomScalePageRoute(
        builder: (context) => targetRoute,
      ),
    );



navigateAndClearStack(BuildContext context, Widget targetRoute) =>
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        // CustomFadePageRoute(
        builder: (context) => targetRoute,
      ),
          (Route<dynamic> route) => false,
    );

