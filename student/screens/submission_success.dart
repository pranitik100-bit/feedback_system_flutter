import 'package:flutter/material.dart';

class SubmissionSuccess extends StatefulWidget {
  final String? teacherName;
  final String? subject;

  const SubmissionSuccess({
    super.key,
    this.teacherName,
    this.subject,
  });

  @override
  State<SubmissionSuccess> createState() => _SubmissionSuccessState();
}

class _SubmissionSuccessState extends State<SubmissionSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // SUCCESS ICON
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE9E6FF),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6C5CE7)
                                .withOpacity(0.18),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(13),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF6C5CE7),
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Thank You! 🎉',
                    style: TextStyle(
                      color: Color(0xFF171923),
                      fontSize: 29,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Your feedback has been\nsubmitted successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF777B8C),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // FEEDBACK ID CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE6E7EE),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'FEEDBACK ID',
                          style: TextStyle(
                            color: Color(0xFF9295A4),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 7),

                        const Text(
                          '#FB10245',
                          style: TextStyle(
                            color: Color(0xFF6C5CE7),
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        if (widget.subject != null) ...[
                          const SizedBox(height: 14),
                          Text(
                            widget.subject!,
                            style: const TextStyle(
                              color: Color(0xFF242631),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],

                        if (widget.teacherName != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.teacherName!,
                            style: const TextStyle(
                              color: Color(0xFF8A8D9B),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // MESSAGE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEAFF),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.favorite_outline_rounded,
                          color: Color(0xFF6C5CE7),
                          size: 21,
                        ),
                        SizedBox(width: 11),
                        Expanded(
                          child: Text(
                            'Your honest feedback helps improve teaching and creates a better learning experience for everyone.',
                            style: TextStyle(
                              color: Color(0xFF5147A8),
                              fontSize: 12,
                              height: 1.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // HOME BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                              (route) => route.isFirst,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C5CE7),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 19,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'BACK TO HOME',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // HISTORY BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6C5CE7),
                        side: const BorderSide(
                          color: Color(0xFFDCDDE5),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'VIEW FEEDBACK HISTORY',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
