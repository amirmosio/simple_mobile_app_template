import 'package:flutter/material.dart';

class LinkRegTextStyle extends TextStyle {
  const LinkRegTextStyle({super.color})
      : super(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        );
}

class LinkSmTextStyle extends TextStyle {
  const LinkSmTextStyle({super.color})
      : super(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        );
}

class StrikeThroughRegTextStyle extends TextStyle {
  const StrikeThroughRegTextStyle({super.color})
      : super(
          fontSize: 16,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w700,
        );
}

class StrikeThroughSmTextStyle extends TextStyle {
  const StrikeThroughSmTextStyle({super.color})
      : super(
          fontSize: 12,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w700,
        );
}

class PillRegTextStyle extends TextStyle {
  const PillRegTextStyle({super.color})
      : super(
          fontSize: 16,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w800,
        );
}

class PillSmTextStyle extends TextStyle {
  const PillSmTextStyle({super.color})
      : super(
          fontSize: 12,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w800,
        );
}
