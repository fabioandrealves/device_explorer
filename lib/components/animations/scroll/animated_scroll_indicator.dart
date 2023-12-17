import 'package:device_explorer/style/percentage_extension.dart';
import 'package:flutter/material.dart';

class AnimatedScrollIndicator extends StatefulWidget {
  final bool isDarkMode;

  const AnimatedScrollIndicator({super.key, this.isDarkMode = true});

  @override
  State<AnimatedScrollIndicator> createState() =>
      _AnimatedScrollIndicatorState();
}

class _AnimatedScrollIndicatorState extends State<AnimatedScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  double _containerHeight = 0.0;
  int _repeatCount = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller)
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          setState(() {
            _containerHeight = 0.0;
          });
          await Future.delayed(const Duration(seconds: 1));
          _controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          if (_repeatCount < 10) {
            _repeatCount++;
            setState(() {
              _containerHeight =
                  12.56.percent() * MediaQuery.sizeOf(context).height;
            });
            await Future.delayed(const Duration(milliseconds: 500));
            _controller.forward();
          }
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {});

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _opacityAnimation,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 40,
                    height: _containerHeight,
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? const Color(0xff010203)
                          : const Color(0xfff7f5f4),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.isDarkMode
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 4.0,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: 36.0,
                      color: widget.isDarkMode
                          ? const Color(0xffeae4da)
                          : const Color(0xff1b212c),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
