part of 'adaptive_divider.dart';

class RoundedDivider extends StatelessWidget {
  const RoundedDivider({
    super.key, 
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.radius = 8,
  });

  final double? height;
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
    final double height = this.height ?? dividerTheme.space ?? defaults.space!;
    
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          height: thickness ?? dividerTheme.thickness ?? defaults.thickness,
          margin: EdgeInsetsDirectional.only(
            start: indent ?? dividerTheme.indent ?? defaults.indent!, 
            end: endIndent ?? dividerTheme.endIndent ?? defaults.endIndent!,
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