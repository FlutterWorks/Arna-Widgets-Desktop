import 'package:arna/arna.dart';

/// Banner types.
enum BannerType {
  /// Information.
  information,

  /// Warning.
  warning,

  /// Error.
  error,

  /// Success.
  success,

  /// Colored.
  colored,
}

/// An Arna-styled banner.
///
/// A banner displays an important, succinct message, and provides actions for users to address or dismiss the banner.
///
/// Banners are displayed at the top of the screen, below a header bar. They are persistent and non-modal, allowing the
/// user to either ignore them or interact with them at any time.
class ArnaBanner extends StatefulWidget {
  /// Creates a banner in the Arna style.
  const ArnaBanner({
    Key? key,
    required this.showBanner,
    required this.title,
    this.subtitle,
    required this.actions,
    this.accentColor,
    this.bannerType = BannerType.information,
  }) : super(key: key);

  /// Whether to show banner or not.
  final bool showBanner;

  /// The primary content of the banner.
  final String title;

  /// Additional content displayed below the title.
  final String? subtitle;

  /// The set of actions that are displayed at the trailing side of the banner.
  final List<Widget>? actions;

  /// The indicator color of the banner.
  final Color? accentColor;

  /// The type of the banner.
  final BannerType bannerType;

  @override
  State<ArnaBanner> createState() => _ArnaBannerState();
}

/// The [State] for a [ArnaBanner].
class _ArnaBannerState extends State<ArnaBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Styles.basicDuration,
      debugLabel: 'ArnaBanner',
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Styles.basicCurve,
    );
    if (widget.showBanner) _controller.forward();
  }

  @override
  void didUpdateWidget(ArnaBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showBanner != oldWidget.showBanner) {
      switch (_controller.status) {
        case AnimationStatus.completed:
        case AnimationStatus.dismissed:
          widget.showBanner ? _controller.forward() : _controller.reverse();
          break;
        case AnimationStatus.forward:
        case AnimationStatus.reverse:
          break;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color accent;
    switch (widget.bannerType) {
      case BannerType.information:
        icon = Icons.info;
        accent = ArnaColors.blue;
        break;
      case BannerType.warning:
        icon = Icons.warning;
        accent = ArnaColors.orange;
        break;
      case BannerType.error:
        icon = Icons.error;
        accent = ArnaColors.red;
        break;
      case BannerType.success:
        icon = Icons.check_circle;
        accent = ArnaColors.green;
        break;
      case BannerType.colored:
        icon = Icons.info;
        accent = widget.accentColor ?? ArnaTheme.of(context).accentColor;
        break;
    }

    Widget banner = Semantics(
      container: true,
      liveRegion: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedContainer(
            duration: Styles.basicDuration,
            curve: Styles.basicCurve,
            color: ArnaDynamicColor.resolve(ArnaColors.headerColor, context),
            child: ArnaListTile(
              leading: Icon(icon, color: ArnaDynamicColor.resolve(accent, context)),
              title: widget.title,
              subtitle: widget.subtitle,
              trailing: widget.actions != null ? Row(mainAxisSize: MainAxisSize.min, children: widget.actions!) : null,
            ),
          ),
          const ArnaDivider(),
        ],
      ),
    );

    return Hero(
      tag: '<ArnaBanner Hero tag - ${widget.title}>',
      child: MediaQuery.of(context).accessibleNavigation
          ? banner
          : SizeTransition(axisAlignment: 1, sizeFactor: _animation, child: banner),
    );
  }
}
