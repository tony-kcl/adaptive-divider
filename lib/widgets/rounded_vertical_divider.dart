part of 'adaptive_divider.dart';

class RoundedVerticalDivider extends StatelessWidget {
  const RoundedVerticalDivider({
    super.key,
    this.width,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.radius = 8,
  });

  final double? width;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final DividerThemeData defaults = theme.useMaterial3 ? _DividerDefaultsM3(context) : _DividerDefaultsM2(context);
    final double width = this.width ?? dividerTheme.space ?? defaults.space!;

    return SizedBox(
      width: width,
      child: Center(
        child: Container(
          width: thickness ?? dividerTheme.thickness ?? defaults.thickness,
          margin: EdgeInsetsDirectional.only(
            top: indent ?? dividerTheme.indent ?? defaults.indent!,
            bottom: endIndent ?? dividerTheme.endIndent ?? defaults.endIndent!,
          ),
          decoration: BoxDecoration(
            color: color ?? dividerTheme.color ?? defaults.color,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}