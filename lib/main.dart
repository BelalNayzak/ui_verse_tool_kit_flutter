
/// reference ui
/// https://uiverse.io/elements
///

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(width: double.infinity, height: 50),

                /// =========== hover me button==========================
                BookWidget(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                Uiverse3DCard(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                UiverseNeonCard(),
                SizedBox(height: 50),

                /// ========== zoom rotate button ===========================
                AnimatedZoomRotationButton(),
                SizedBox(height: 50),

                /// ========== zoom rotate button ===========================
                AnimatedZoomRotationButton2(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                HoverButton(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                AnimatedPaymentButton(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                AnimatedTextToIconButton(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                AnimatedHoverBkgButton(),
                SizedBox(height: 50),

                /// =========== hover me button==========================
                ShinyAnimatedButton(),
                SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// zoom rotation button
///
class AnimatedZoomRotationButton extends StatefulWidget {
  const AnimatedZoomRotationButton({super.key});

  @override
  _AnimatedZoomRotationButtonState createState() =>
      _AnimatedZoomRotationButtonState();
}

class _AnimatedZoomRotationButtonState
    extends State<AnimatedZoomRotationButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), // سرعة الأنميشن
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 10 * pi / 180).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: const Color(0xFFFA725A),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleHover(bool isHovered) {
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform(
            alignment: Alignment.center, // الدوران من المركز
            transform: Matrix4.identity()
              ..scale(_scaleAnimation.value)
              ..rotateZ(_rotationAnimation.value),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFA725A), width: 4),
            color: _colorAnimation.value, // يتحول بسلاسة من شفاف إلى برتقالي والعكس
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            "# Click Me",
            style: TextStyle(
              color: _controller.value > 0.5 ? Colors.white : const Color(0xFFFA725A),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

/// zoom rotation button
///
class AnimatedZoomRotationButton2 extends StatefulWidget {
  const AnimatedZoomRotationButton2({super.key});

  @override
  _AnimatedZoomRotationButton2State createState() =>
      _AnimatedZoomRotationButton2State();
}

class _AnimatedZoomRotationButton2State extends State<AnimatedZoomRotationButton2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 10 * pi / 180).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: const Color(0xFFFA725A),
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {}); // يجبر الواجهة على إعادة البناء عند تغير اللون
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleHover(bool isHovered) {
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(_scaleAnimation.value)
              ..rotateZ(_rotationAnimation.value),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFA725A), width: 4),
                color: _colorAnimation.value, // اللون الآن يعمل بشكل صحيح
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "# Click Me",
                style: TextStyle(
                  color: _controller.value > 0.5 ? Colors.white : const Color(0xFFFA725A),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// hover me button
///
class HoverButton extends StatefulWidget {
  const HoverButton({super.key});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// الخلفية الدائرية المتحركة
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: isHovered ? 140 : 40, // تبدأ كدائرة صغيرة ثم تتمدد عند التحويم
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFB1DAE7),
              borderRadius: BorderRadius.circular(50),
            ),
          ),

          /// النص والأيقونة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Hover me",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF234567),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF234567),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// hover bkg button with slide animation
///
class AnimatedPaymentButton extends StatefulWidget {
  const AnimatedPaymentButton({super.key});

  @override
  _AnimatedPaymentButtonState createState() => _AnimatedPaymentButtonState();
}

class _AnimatedPaymentButtonState extends State<AnimatedPaymentButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        children: [
          // الخلفية الأساسية البيضاء
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
          ),
          // الخلفية الخضراء المتحركة
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            left: 0,
            width: isHovered ? 160 : 48, // مرتبط بحجم الأيقونة
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: const Radius.circular(25),
                right: isHovered ? const Radius.circular(25) : Radius.zero,
              ),
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
          // المحتوى (الأيقونة + النص)
          SizedBox(
            width: 160,
            height: 50,
            child: Row(
              children: [
                // أيقونة الطائرة الورقية داخل الخلفية الخضراء
                SizedBox(
                  width: 48,
                  height: 50,
                  child: Center(
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
                // النص مع تغيير اللون عند التحويم
                Expanded(
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 100),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isHovered ? Colors.white : Colors.black,
                      ),
                      child: const Text("Payments"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// text to icon button
///
class AnimatedTextToIconButton extends StatefulWidget {
  const AnimatedTextToIconButton({super.key});

  @override
  _AnimatedTextToIconButtonState createState() => _AnimatedTextToIconButtonState();
}

class _AnimatedTextToIconButtonState extends State<AnimatedTextToIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // حساب حجم الأيقونة ديناميكيًا
    const double iconSize = 24.0;
    const double padding = 12.0; // هوامش داخلية حول الأيقونة
    final double initialGreenWidth = iconSize + (2 * padding); // العرض الأولي للخلفية الخضراء

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isHovered ? Colors.green : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // الجزء الأخضر المتغير في الحجم بناءً على الأيقونة
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              width: isHovered ? 160 : initialGreenWidth, // عرض ديناميكي للأيقونة
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(25),
                  right: isHovered ? const Radius.circular(25) : Radius.zero,
                ),
                color: Colors.green,
              ),
              child: Center(
                child: Icon(Icons.send, color: Colors.white, size: iconSize),
              ),
            ),
            // النص داخل الزر
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 100),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isHovered ? Colors.white : Colors.black,
                  ),
                  child: isHovered ? const SizedBox() : const Text("Payments", maxLines: 1,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// hover bkg button normal
///
class AnimatedHoverBkgButton extends StatefulWidget {
  const AnimatedHoverBkgButton({super.key});

  @override
  _AnimatedHoverBkgButtonState createState() => _AnimatedHoverBkgButtonState();
}

class _AnimatedHoverBkgButtonState extends State<AnimatedHoverBkgButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isHovered ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Payments",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// shiny hover button
///
class ShinyAnimatedButton extends StatefulWidget {
  const ShinyAnimatedButton({super.key});

  @override
  _ShinyAnimatedButtonState createState() => _ShinyAnimatedButtonState();
}

class _ShinyAnimatedButtonState extends State<ShinyAnimatedButton> with SingleTickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
            decoration: BoxDecoration(
              color: isHovered ? Colors.transparent : const Color(0xFFFEC195),
              border: Border.all(color: const Color(0xFFFEC195), width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color: const Color(0xFFFEC195).withOpacity(0.55),
                  blurRadius: 25,
                )
              ]
                  : [],
            ),
            child: Text(
              "Button",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: isHovered ? const Color(0xFFFEC195) : const Color(0xFF181818),
              ),
            ),
          ),
          if (isHovered) ..._buildAnimatedStars(),
        ],
      ),
    );
  }

  List<Widget> _buildAnimatedStars() {
    final random = Random();
    final List<Offset> starPositions = [
      const Offset(-40, -50), // star-1
      const Offset(0, -60), // star-2
      const Offset(50, -40), // star-3
      const Offset(-30, 30), // star-4
      const Offset(40, 40), // star-5
      const Offset(-80, -20), // star-6
    ];

    return List.generate(starPositions.length, (index) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 100 + random.nextInt(400)),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(starPositions[index].dx * value, starPositions[index].dy * value),
            child: Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Icon(
                  Icons.star,
                  color: Colors.amber.withOpacity(0.8),
                  size: [20, 15, 10, 8, 12, 15][index].toDouble(),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

/// book gift card
///

class BookWidget extends StatefulWidget {
  const BookWidget({super.key});

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _coverAnimation;
  late Animation<double> _innerRotationAnimation;
  late Animation<double> _innerTranslationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _coverAnimation = Tween<double>(begin: 0, end: pi / 2.5).animate(_controller);
    _innerRotationAnimation = Tween<double>(begin: 0, end: pi / 7).animate(_controller);
    _innerTranslationAnimation = Tween<double>(begin: 0, end: 140).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBook(bool isHovered) {
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleBook(true),
      onExit: (_) => _toggleBook(false),
      child: SizedBox(
        width: 180,
        height: 250,
        child: Stack(
          children: [
            _buildBookBase(), // Back Cover (Main Book)
            AnimatedBuilder(
              animation: _innerTranslationAnimation,
              builder: (_, child) {
                return Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(_innerTranslationAnimation.value, 0.0)
                    ..rotateZ(_innerRotationAnimation.value)
                    ..rotateX(-_innerRotationAnimation.value / 2),
                  child: child,
                );
              },
              child: _buildInnerPage(),
            ),
            AnimatedBuilder(
              animation: _coverAnimation,
              builder: (_, child) {
                return Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_coverAnimation.value), // تغيير الاتجاه ليكون الغلاف يفتح للخارج
                  child: child,
                );
              },
              child: _buildCover(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookBase() {
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)],
      ),
      alignment: Alignment.center,
      child: Text("World", style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }

  Widget _buildCover() {
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)],
      ),
      alignment: Alignment.center,
      child: Text("Cover", style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }

  Widget _buildInnerPage() {
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)],
      ),
      alignment: Alignment.center,
      child: Text("Hello", style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}

/// 3d ui card
///
class Uiverse3DCard extends StatefulWidget {
  const Uiverse3DCard({super.key});

  @override
  _Uiverse3DCardState createState() => _Uiverse3DCardState();
}

class _Uiverse3DCardState extends State<Uiverse3DCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isHovered
                ? [Colors.green.shade400, Colors.green.shade500]
                : [Colors.green.shade300, Colors.green.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Stack(
          children: [
            // Gradient overlay
            Positioned(
              top: -50,
              right: -50,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isHovered ? 1 : 0,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.transparent
                      ],
                      stops: const [0.2, 1],
                    ),
                  ),
                ),
              ),
            ),

            // Card Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // UI Top Right Logo
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'UI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Main Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UIVERSE (3D UI)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create, share, and use\nbeautiful custom elements\nmade with CSS',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  // Social Icons and View More
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Social Icons
                      Row(
                        children: [
                          _socialIcon(Icons.camera_alt_outlined),
                          const SizedBox(width: 8),
                          _socialIcon(Icons.facebook),
                          const SizedBox(width: 8),
                          _socialIcon(Icons.discord),
                        ],
                      ),

                      // View More
                      Text(
                        'View more',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

/// card neon ui
///
class UiverseNeonCard extends StatefulWidget {
  const UiverseNeonCard({Key? key}) : super(key: key);

  @override
  _UiverseNeonCardState createState() => _UiverseNeonCardState();
}

class _UiverseNeonCardState extends State<UiverseNeonCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 300,
        height: 400,
        child: Stack(
          children: [
            // Rotated Neon Layers
            Positioned.fill(
              child: Transform.rotate(
                angle: -0.1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade400,
                        Colors.purple.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Transform.rotate(
                angle: 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade400,
                        Colors.blue.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Main Card
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // Neon Border
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Content
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        'Uiverse',
                        style: TextStyle(
                          color: Colors.pink.shade300,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.pink.shade300.withOpacity(0.7),
                              blurRadius: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
//
//
// Future<void> main() async {
//   runApp(MaterialApp(home: CounterScreen()));
// }
//
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
// }
//
// class CounterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: CounterView(),
//     );
//   }
// }
//
// class CounterView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Counter Dialog Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Counter Value:', style: TextStyle(fontSize: 20)),
//             BlocBuilder<CounterCubit, int>(
//               builder: (context, count) => Text(
//                 '$count',
//                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => _showCounterDialog(context),
//               child: Text('Open Counter Dialog'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showCounterDialog(BuildContext context) {
//     final counterCubit = context.read<CounterCubit>(); // Get the cubit before calling showDialog
//
//     showDialog(
//       context: context,
//       builder: (dialogContext) => BlocProvider.value(
//         value: counterCubit, // Pass the same instance to the dialog
//         child: CounterDialog(),
//       ),
//     );
//   }
//
//
// }
//
// class CounterDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Increment Counter'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           BlocBuilder<CounterCubit, int>(
//             builder: (context, count) => Text(
//               '$count',
//               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () => context.read<CounterCubit>().increment(),
//             child: Text('+'),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('Close'),
//         ),
//       ],
//     );
//   }
// }
