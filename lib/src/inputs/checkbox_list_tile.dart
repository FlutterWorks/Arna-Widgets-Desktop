import 'package:arna/arna.dart';

/// A [ArnaListTile] with a [ArnaCheckBox]. In other words, a checkbox with a label.
///
/// The entire list tile is interactive: tapping anywhere in the tile toggles the checkbox.
///
/// The [value] and [onChanged] properties of this widget are identical to the similarly-named properties on the
/// [ArnaCheckBox] widget.
///
/// The [title] and [subtitle] properties are like  those of the same name on [ArnaListTile].
///
/// To show the [ArnaCheckBoxListTile] as disabled, pass null as the [onChanged] callback.
///
/// See also:
///
///  * [ArnaRadioListTile], a similar widget for radio buttons.
///  * [ArnaSwitchListTile], a similar widget for switches.
///  * [ArnaSliderListTile], a similar widget for sliders.
///  * [ArnaListTile] and [ArnaCheckBox], the widgets from which this widget is made.
class ArnaCheckBoxListTile extends StatelessWidget {
  /// Creates a combination of a list tile and a checkbox.
  ///
  /// The checkbox tile itself does not maintain any state. Instead, when the state of the checkbox changes, the widget
  /// calls the [onChanged] callback. Most widgets that use a checkbox will listen for the [onChanged] callback and
  /// rebuild the checkbox tile with a new [value] to update the visual appearance of the checkbox.
  ///
  /// The following arguments are required:
  ///
  /// * [value], which determines whether the checkbox is checked. The [value] can only be null if [tristate] is true.
  /// * [onChanged], which is called when the value of the checkbox should change. It can be set to null to disable the
  ///   checkbox.
  ///
  /// The value of [tristate] must not be null.
  const ArnaCheckBoxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.trailing,
    this.tristate = false,
    this.isFocusable = true,
    this.autofocus = false,
    this.accentColor,
    this.cursor = MouseCursor.defer,
    this.semanticLabel,
  });

  /// Whether this checkbox is checked.
  final bool? value;

  /// Called when the value of the checkbox should change.
  ///
  /// The checkbox passes the new value to the callback but does not actually change state until the parent widget
  /// rebuilds the checkbox with the new value.
  ///
  /// If this callback is null, the checkbox will be displayed as disabled and will not respond to input gestures.
  ///
  /// When the checkbox is tapped, if [tristate] is false (the default) then the [onChanged] callback will be applied
  /// to `!value`. If [tristate] is true this callback cycle from false to true to null.
  ///
  /// The callback provided to [onChanged] should update the state of the parent [StatefulWidget] using the
  /// [State.setState] method, so that the parent gets rebuilt; for example:
  ///
  /// ```dart
  /// ArnaCheckBoxListTile(
  ///   value: _throwShotAway,
  ///   onChanged: (bool? newValue) {
  ///     setState(() {
  ///       _throwShotAway = newValue!;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool?>? onChanged;

  /// The primary content of the list tile.
  final String? title;

  /// Additional content displayed below the title.
  final String? subtitle;

  /// A widget to display after the title.
  final Widget? trailing;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// Checkbox displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged] callback will be applied to true if the
  /// current value is false, to null if value is true, and to false if value is null (i.e. it cycles through
  /// false => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// Whether this checkbox is focusable or not.
  final bool isFocusable;

  /// Whether this checkbox should focus itself if nothing else is already focused.
  final bool autofocus;

  /// The color of the checkbox's focused border and selected state.
  final Color? accentColor;

  /// The cursor for a mouse pointer when it enters or is hovering over the checkbox.
  final MouseCursor cursor;

  /// The semantic label of the checkbox.
  final String? semanticLabel;

  void _handleTap() {
    if (onChanged != null) {
      switch (value) {
        case false:
          onChanged!(true);
          break;
        case true:
          onChanged!(tristate ? null : false);
          break;
        case null:
          onChanged!(false);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ArnaListTile(
      leading: ArnaCheckBox(
        value: value,
        tristate: tristate,
        onChanged: onChanged,
        isFocusable: isFocusable,
        autofocus: autofocus,
        accentColor: accentColor,
        cursor: cursor,
        semanticLabel: semanticLabel,
      ),
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onChanged != null ? _handleTap : null,
      actionable: true,
      cursor: cursor,
    );
  }
}
