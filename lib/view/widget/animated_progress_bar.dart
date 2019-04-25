import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class AnimatedProgressBar extends StatefulWidget {
  AnimatedProgressBar({Key key,
    this.currentValue = 0,
    this.maxValue = 100,
    this.size = 30,
    this.animatedDuration = const Duration(milliseconds: 300),
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.decoration,
    this.backgroundDecoration
  }) : super(key: key);
  final int currentValue;
  final int maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final BoxDecoration decoration;
  final BoxDecoration backgroundDecoration;

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    triggerAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar old) {
    triggerAnimation();
    super.didUpdateWidget(old);
  }

  void triggerAnimation() {
    setState(() {
      _currentBegin = _animation.value;
      _currentEnd = widget.currentValue / widget.maxValue;
      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => _AnimatedProgressBar(
    animation: _animation,
    widget: widget,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedProgressBar extends AnimatedWidget {
  final _defaultProgressDecoration = BoxDecoration(
      color: Color(0xFF056060),
      borderRadius: BorderRadius.circular(8),
    );
  final _defaultBackgroundDecoration = BoxDecoration(
      color: Color(0x00056060),
      borderRadius: BorderRadius.circular(8),
  );

  final AnimatedProgressBar widget;

  _AnimatedProgressBar({
    Key key,
    Animation<double> animation,
    this.widget,
  }) : super(key: key, listenable: animation);


  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.direction == Axis.vertical ? widget.size : null,
        height: widget.direction == Axis.horizontal ? widget.size : null,
        decoration: widget.backgroundDecoration ?? _defaultBackgroundDecoration,
        child: Flex(
          direction: widget.direction,
          verticalDirection: widget.verticalDirection,
          children: <Widget>[
            Expanded(
                flex: (animation.value * 100).toInt(),
                child: new Container(
                    decoration: widget.decoration ?? _defaultProgressDecoration
                )
            ),
            Expanded(
                flex: 100 - (animation.value * 100).toInt(), child: Container())
          ],
        ),
      ),
    );
  }
}
