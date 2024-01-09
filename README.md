A Divider that can easily adding to flex widgets, such as Columns and Rows, boasting rounded corners for added visual appeal.

## Getting started

In your library add the following import:
```dart
import 'package:adaptive_divider/adaptive_divider.dart';
```

## Usage

```dart
build(BuildContext context) {
    List<Widget> children = [
        WidgetA(),
        AdaptiveDivider(),
        WidgetB(),
        AdaptiveDivider(),
        WidgetC(),
    ];
    if (row) {
        return Row(
            children: children,
        );
    } else {
        return Column(
            children: children,
        );
    }
}
```