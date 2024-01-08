
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'rounded_divider.dart';
part 'rounded_vertical_divider.dart';

class AdaptiveDivider extends StatelessWidget {
  const AdaptiveDivider({
    super.key,
    this.thickness,
    this.crossAxisExtent,
    this.color,
    this.indent,
    this.endIndent,
    this.radius = 0,
  });

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// width of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used which
  /// defaults to 0.0.
  final double? thickness;

  /// If it is horizontal, [crossAxisExtent] is height
  /// 
  /// If it is vertical, [crossAxisExtent] is width
  final double? crossAxisExtent;


  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// const Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  /// The amount of empty space on top of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? indent;

  /// The amount of empty space under the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? endIndent;
  

  /// The radius of divider
  /// 
  /// Default value is 0.0
  final double radius;

  @override
  Widget build(BuildContext context) {
    final scrollableState = Scrollable.maybeOf(context);
    final AxisDirection? axisDirection = scrollableState?.axisDirection;
    Axis? fallbackDirection =
        axisDirection == null ? null : axisDirectionToAxis(axisDirection);

    final parent = context.findAncestorRenderObjectOfType();
    if (parent is RenderFlex) {
      fallbackDirection = parent.direction;
    }

    if (fallbackDirection == null) {
      if (kDebugMode) {
        throw FlutterError(
          'A Gap widget must be placed directly inside a Flex widget '
          'or its fallbackDirection must not be null',
        );
      }
      return const SizedBox();
    } else {
      if (fallbackDirection == Axis.horizontal) {
        return RoundedVerticalDivider(
          width: crossAxisExtent, thickness: thickness, 
          indent: indent, endIndent: endIndent, color: color,
          radius: radius,
        );
      } else {
        return RoundedDivider(
          height: crossAxisExtent, thickness: thickness, 
          indent: indent, endIndent: endIndent, color: color,
          radius: radius,
        );
      }
    }
  }
}

class _DividerDefaultsM2 extends DividerThemeData {
  const _DividerDefaultsM2(this.context) : super(
    space: 16,
    thickness: 0,
    indent: 0,
    endIndent: 0,
  );

  final BuildContext context;

  @override Color? get color => Theme.of(context).dividerColor;
}

class _DividerDefaultsM3 extends DividerThemeData {
  const _DividerDefaultsM3(this.context) : super(
    space: 16,
    thickness: 1.0,
    indent: 0,
    endIndent: 0,
  );

  final BuildContext context;

  @override Color? get color => Theme.of(context).colorScheme.outlineVariant;
}