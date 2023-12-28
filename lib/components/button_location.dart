import 'package:flutter/material.dart';

class BottomRightButton extends FloatingActionButtonLocation {
  const BottomRightButton();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Padding from the right edge of the screen remains the same.
    const double padding = 20.0;
    // Increase the bottom padding to move the button upwards.
    const double bottomPadding =
        55.0; // Increase this value to move the button up

    // Width of the screen minus the width of the button and right padding
    final double offsetX = scaffoldGeometry.scaffoldSize.width -
        scaffoldGeometry.floatingActionButtonSize.width -
        padding;

    // Height of the screen minus the height of the button, bottom padding, and any bottom sheet height
    final double offsetY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        bottomPadding - // Using the increased bottom padding
        scaffoldGeometry.bottomSheetSize
            .height; // If there's a bottom sheet, reduce its height too

    // Return the calculated offset
    return Offset(offsetX, offsetY);
  }
}
