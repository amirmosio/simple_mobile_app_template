import 'package:flutter/material.dart';

// TODO set line heights later
class BodyLgTextStyle extends TextStyle {
  const BodyLgTextStyle({super.color})
      : super(fontSize: 20, fontWeight: FontWeight.w400, height: 1.2);
}

class BodyRegTextStyle extends TextStyle {
  const BodyRegTextStyle({super.color})
      : super(fontSize: 16, fontWeight: FontWeight.w400, height: 1.25);
}

class BodySmTextStyle extends TextStyle {
  const BodySmTextStyle({super.color})
      : super(fontSize: 12, fontWeight: FontWeight.w400, height: 1.33);
}

class BodySmAltTextStyle extends TextStyle {
  const BodySmAltTextStyle({super.color})
      : super(fontSize: 12, fontWeight: FontWeight.w700, height: 1.33);
}

class LabelTextStyle extends TextStyle {
  const LabelTextStyle({super.color})
      : super(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        );
}

class HintTextStyle extends TextStyle {
  // font size 10 does not fit well, idk why
  const HintTextStyle({super.color})
      : super(fontSize: 12, fontWeight: FontWeight.w400, height: 1.6);
}

class AltBoldHintTextStyle extends TextStyle {
  const AltBoldHintTextStyle({super.color})
      : super(fontSize: 12, fontWeight: FontWeight.w900, height: 1.6);
}
