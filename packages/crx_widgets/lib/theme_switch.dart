// import 'package:flutter/widgets.dart';
// import 'clickable.dart';
// const _fastestDuration = Duration(milliseconds: 150);
// const _fastDuration = Duration(milliseconds: 250);
//
// class LightDarkToggleSwitch extends StatefulWidget {
//   final switchDuration;
//
//   const LightDarkToggleSwitch({
//     Key key,
//     this.switchDuration = const Duration(milliseconds: 35),
//   }) : super(key: key);
//
//   @override
//   _LightDarkToggleSwitchState createState() => _LightDarkToggleSwitchState();
// }
//
// class _LightDarkToggleSwitchState extends State<LightDarkToggleSwitch> {
//   int lastSwitchTime = 0;
//
//   void _handleTogglePressed(BuildContext context) {
//     if (DateTime.now().millisecondsSinceEpoch - lastSwitchTime < widget.switchDuration) {
//       return;
//     }
//     lastSwitchTime = DateTime.now().millisecondsSinceEpoch;
//     context.read<AppModel>().nextTheme();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     double iconSize = 18;
//     double innerWidth = 54;
//     // Use a stateful builder so we can rebuild ourselves on click without going to a StatefulWidget
//     return Row(
//       children: [
//         StyledImageIcon(StyledIcons.lightMode, size: iconSize, color: Colors.white),
//         SizedBox(height: 6),
//         Stack(children: [
//           StyledContainer(
//             theme.accent1Darker,
//             borderRadius: BorderRadius.circular(19),
//             width: innerWidth,
//             height: 24,
//           ),
//           TweenAnimationBuilder(
//             tween: Tween<double>(begin: 0, end: theme.isDark ? 1 : 0),
//             duration: _fastestDuration,
//             builder: (_, value, __) => StyledContainer(
//               theme.surface,
//               duration: _fastDuration,
//               margin: EdgeInsets.only(top: 2, left: 2 + (innerWidth - 20 - 4) * value, right: 2),
//               borderRadius: BorderRadius.circular(99),
//               width: 20,
//               height: 20,
//             ),
//           ),
//         ]),
//         SizedBox(height: 6),
//         StyledImageIcon(StyledIcons.darkMode, size: iconSize - 2, color: ColorUtils.shiftHsl(theme.accent1, -.1)),
//       ],
//     ).clickable(() => _handleTogglePressed(context), opaque: true);
//   }
// }
//TODO