import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

typedef ColorCodeBuilder = Widget Function(BuildContext context, Color color);

class CircleColorPicker extends StatefulWidget {
  void Function() onClick;
  CircleColorPicker({
    Key key,
    this.onClick,
    this.onChanged,
    this.size = const Size(280, 280),
    this.strokeWidth = 2,
    this.thumbSize = 32,
    this.initialColor = const Color.fromARGB(255, 255, 0, 0),
    this.textStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.colorCodeBuilder,
  }) : super(key: key);

  /// Called during a drag when the user is selecting a color.
  ///
  /// This callback called with latest color that user selected.
  final ValueChanged<Color> onChanged;

  /// The size of widget.
  /// Draggable area is thumb widget is included to the size,
  /// so circle is smaller than the size.
  ///
  /// Default value is 280 x 280.
  final Size size;

  /// The width of circle border.
  ///
  /// Default value is 2.
  final double strokeWidth;

  /// The size of thumb for circle picker.
  ///
  /// Default value is 32.
  final double thumbSize;

  /// Initial color for picker.
  /// [onChanged] callback won't be called with initial value.
  ///
  /// Default value is Red.
  final Color initialColor;

  /// Text style config
  ///
  /// Default value is Black
  final TextStyle textStyle;

  /// Widget builder that show color code section.
  /// This functions is called every time color changed.
  ///
  /// Default is Text widget that shows rgb strings;
  final ColorCodeBuilder colorCodeBuilder;

  double get initialLightness => HSLColor.fromColor(initialColor).lightness;

  double get initialHue => HSLColor.fromColor(initialColor).hue;

  @override
  _CircleColorPickerState createState() => _CircleColorPickerState();
}

class _CircleColorPickerState extends State<CircleColorPicker>
    with TickerProviderStateMixin {
  AnimationController _lightnessController;
  AnimationController _hueController;

  Color get _color {
    return HSLColor.fromAHSL(
      1,
      _hueController.value,
      1,
      _lightnessController.value,
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: <Widget>[
          _HuePicker(
            initialHue: widget.initialHue,
            size: widget.size,
            strokeWidth: widget.strokeWidth,
            thumbSize: widget.thumbSize,
            onChanged: (hue) {
              _hueController.value = hue * 180 / pi;
            },
          ),
          AnimatedBuilder(
            animation: _hueController,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: _lightnessController,
                builder: (context, _) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        Stack(
                          alignment: Alignment.center,
                          children:[
                            CircleAvatar(
                              radius: 43.5,
                              backgroundColor: _color,
                            ),
                            RawMaterialButton(
                              onPressed: widget.onClick,
                              elevation: 0,
                              fillColor: Theme.of(context).accentColor,
                              child: Icon(
                                Icons.lightbulb_outline,
                                size: 30.0,
                                color: Theme.of(context).cardColor,
                              ),
                              padding: EdgeInsets.all(25),
                              shape: CircleBorder(),
                            ),
                          ] 
                        ),
                        const SizedBox(height: 20),
                        _LightnessSlider(
                          initialLightness: widget.initialLightness,
                          width: 140,
                          thumbSize: 26,
                          hue: _hueController.value,
                          onChanged: (lightness) {
                            _lightnessController.value = lightness;
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _hueController = AnimationController(
      vsync: this,
      value: widget.initialHue,
      lowerBound: 0,
      upperBound: 360,
    )..addListener(_onColorChanged);
    _lightnessController = AnimationController(
      vsync: this,
      value: widget.initialLightness,
      lowerBound: 0,
      upperBound: 1,
    )..addListener(_onColorChanged);
  }

  void _onColorChanged() {
    widget.onChanged?.call(_color);
  }
}

class _LightnessSlider extends StatefulWidget {
  const _LightnessSlider({
    Key key,
    this.hue,
    this.width,
    this.onChanged,
    this.thumbSize,
    this.initialLightness,
  }) : super(key: key);

  final double hue;

  final double width;

  final ValueChanged<double> onChanged;

  final double thumbSize;

  final double initialLightness;

  @override
  _LightnessSliderState createState() => _LightnessSliderState();
}

class _LightnessSliderState extends State<_LightnessSlider>
    with TickerProviderStateMixin {
  AnimationController _lightnessController;
  AnimationController _scaleController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: SizedBox(
        width: widget.width,
        height: widget.thumbSize,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 12,
              margin: EdgeInsets.symmetric(
                horizontal: widget.thumbSize / 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                gradient: LinearGradient(
                  stops: [0, 0.4, 1],
                  colors: [
                    HSLColor.fromAHSL(1, widget.hue, 1, 0).toColor(),
                    HSLColor.fromAHSL(1, widget.hue, 1, 0.5).toColor(),
                    HSLColor.fromAHSL(1, widget.hue, 1, 0.9).toColor(),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _lightnessController,
              builder: (context, child) {
                return Positioned(
                  left: _lightnessController.value *
                      (widget.width - widget.thumbSize),
                  child: ScaleTransition(
                    scale: _scaleController,
                    child: _Thumb(
                      size: widget.thumbSize,
                      color: HSLColor.fromAHSL(
                        1,
                        widget.hue,
                        1,
                        _lightnessController.value,
                      ).toColor(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _lightnessController = AnimationController(
      vsync: this,
      value: widget.initialLightness,
    )..addListener(() => widget.onChanged(_lightnessController.value));
    _scaleController = AnimationController(
      vsync: this,
      value: 1,
      lowerBound: 0.9,
      upperBound: 1,
      duration: Duration(milliseconds: 50),
    );
  }

  void _onPanStart(DragStartDetails details) {
    _scaleController.reverse();
    _lightnessController.value = details.localPosition.dx / widget.width;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _lightnessController.value = details.localPosition.dx / widget.width;
  }

  void _onPanEnd(DragEndDetails details) {
    _scaleController.forward();
  }
}

class _HuePicker extends StatefulWidget {
  _HuePicker({
    Key key,
    this.onChanged,
    this.size,
    this.strokeWidth,
    this.thumbSize,
    this.initialHue,
  }) : super(key: key);

  final ValueChanged<double> onChanged;

  final Size size;

  final double strokeWidth;

  final double thumbSize;

  final double initialHue;

  @override
  _HuePickerState createState() => _HuePickerState();
}

class _HuePickerState extends State<_HuePicker> with TickerProviderStateMixin {
  AnimationController _hueController;
  AnimationController _scaleController;
  Animation<Offset> _offset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Padding(
                padding: EdgeInsets.all(
                  widget.thumbSize / 2 - widget.strokeWidth,
                ),
                child: CustomPaint(
                  painter: _CirclePickerPainter(widget.strokeWidth),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _offset,
              builder: (context, child) {
                return Positioned(
                  left: _offset.value.dx,
                  top: _offset.value.dy,
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _hueController,
                builder: (context, child) {
                  final hue = _hueController.value * (180 / pi);
                  return ScaleTransition(
                    scale: _scaleController,
                    child: _Thumb(
                      size: widget.thumbSize,
                      color: HSLColor.fromAHSL(1, hue, 1, 0.5).toColor(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final minSize = min(widget.size.width, widget.size.height);
    _hueController = AnimationController(
      vsync: this,
      value: widget.initialHue * pi / 180,
      lowerBound: 0,
      upperBound: 2 * pi,
    )..addListener(() => widget.onChanged(_hueController.value));
    _scaleController = AnimationController(
      vsync: this,
      value: 1,
      lowerBound: 0.9,
      upperBound: 1,
      duration: Duration(milliseconds: 50),
    );
    _offset = _CircleTween(
      minSize / 2 - widget.thumbSize / 2,
    ).animate(_hueController);
  }

  void _onPanStart(DragStartDetails details) {
    _scaleController.reverse();
    _updatePosition(details.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _updatePosition(details.localPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _scaleController.forward();
  }

  void _updatePosition(Offset position) {
    final radians = atan2(
      position.dy - widget.size.height / 2,
      position.dx - widget.size.width / 2,
    );
    _hueController.value = radians % (2 * pi);
  }
}

class _CircleTween extends Tween<Offset> {
  _CircleTween(this.radius)
      : super(
    begin: _radiansToOffset(0, radius),
    end: _radiansToOffset(2 * pi, radius),
  );

  final double radius;

  @override
  Offset lerp(double t) => _radiansToOffset(t, radius);

  static Offset _radiansToOffset(double radians, double radius) {
    return Offset(
      radius + radius * cos(radians),
      radius + radius * sin(radians),
    );
  }
}

class _CirclePickerPainter extends CustomPainter {
  const _CirclePickerPainter(
      this.strokeWidth,
      );

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radio = min(size.width, size.height) / 2 - strokeWidth;

    const sweepGradient = SweepGradient(
      colors: const [
        Color.fromARGB(255, 255, 0, 0),
        Color.fromARGB(255, 255, 255, 0),
        Color.fromARGB(255, 0, 255, 0),
        Color.fromARGB(255, 0, 255, 255),
        Color.fromARGB(255, 0, 0, 255),
        Color.fromARGB(255, 255, 0, 255),
        Color.fromARGB(255, 255, 0, 0),
      ],
    );

    final sweepShader = sweepGradient.createShader(
      Rect.fromCircle(center: center, radius: radio),
    );

    canvas.drawCircle(
      center,
      radio,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth * 2
        ..shader = sweepShader,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _Thumb extends StatelessWidget {
  _Thumb({Key key, this.size, this.color}) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(16, 0, 0, 0),
              blurRadius: 4,
              spreadRadius: 4,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          width: size - 6,
          height: size - 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}