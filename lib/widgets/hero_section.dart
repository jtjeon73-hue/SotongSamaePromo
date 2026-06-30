import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_layout.dart';
import 'phone_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onPromoBrowseTap,
    required this.onFeaturesTap,
    required this.onFeedbackTap,
  });

  final VoidCallback onPromoBrowseTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onFeedbackTap;

  @override
  Widget build(BuildContext context) {
    final isWide = AppLayout.isWide(context);
    final isMobile = AppLayout.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F2E1C),
            AppColors.deepGreen,
            AppColors.olive,
            AppColors.heroAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.35, 0.72, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: isWide ? 80 : -40,
            top: isWide ? -40 : -20,
            child: Container(
              width: isWide ? 280 : 180,
              height: isWide ? 280 : 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            left: isWide ? -60 : -30,
            bottom: isWide ? 40 : 20,
            child: Container(
              width: isWide ? 200 : 120,
              height: isWide ? 200 : 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.horizontalPadding(context),
              vertical: isMobile ? 36 : (isWide ? 80 : 52),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1180),
                child: Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: isWide ? 6 : 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen.withValues(alpha: 0.22),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppColors.lightGreen.withValues(alpha: 0.45)),
                            ),
                            child: Text(
                              AppCatalog.prelaunchBadge,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.95),
                                fontSize: isMobile ? 11 : 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 14 : 18),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _HeroPill('전북 남원시 사매면'),
                              _HeroPill('앱 미리보기', filled: true),
                            ],
                          ),
                          SizedBox(height: isMobile ? 18 : 24),
                          Text(
                            AppCatalog.tagline,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isWide ? 44 : (isMobile ? 26 : 34),
                              height: 1.2,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            AppCatalog.subtitle,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: isMobile ? 15 : 18,
                              height: 1.65,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            AppCatalog.heroLead,
                            style: TextStyle(
                              color: AppColors.lightGreen.withValues(alpha: 0.95),
                              fontSize: isMobile ? 13 : 15,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: isMobile ? 22 : 28),
                          _HeroStatsRow(compact: isMobile),
                          SizedBox(height: isMobile ? 22 : 28),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.deepGreen,
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 16 : 22,
                                    vertical: isMobile ? 14 : 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                                ),
                                onPressed: onPromoBrowseTap,
                                icon: const Icon(Icons.web_outlined, size: 20),
                                label: const Text('프로모 사이트 둘러보기'),
                              ),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(color: Colors.white.withValues(alpha: 0.45)),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 16 : 22,
                                    vertical: isMobile ? 14 : 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                                ),
                                onPressed: onFeaturesTap,
                                icon: const Icon(Icons.apps_outlined, size: 20),
                                label: const Text('주요 기능 미리보기'),
                              ),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.lightGreen,
                                  side: BorderSide(color: AppColors.lightGreen.withValues(alpha: 0.5)),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 16 : 22,
                                    vertical: isMobile ? 14 : 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                                ),
                                onPressed: onFeedbackTap,
                                icon: const Icon(Icons.edit_note_outlined, size: 20),
                                label: const Text('의견 보내기'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isWide) const SizedBox(width: 40),
                    if (!isWide) const SizedBox(height: 28),
                    Flexible(
                      flex: isWide ? 5 : 0,
                      fit: isWide ? FlexFit.tight : FlexFit.loose,
                      child: Align(
                        alignment: Alignment.center,
                        child: PhoneMockup(compact: isMobile),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPill extends StatelessWidget {
  const _HeroPill(this.text, {this.filled = false});

  final String text;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: filled ? Colors.white.withValues(alpha: 0.16) : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _HeroStatsRow extends StatelessWidget {
  const _HeroStatsRow({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: compact ? 8 : 12,
      runSpacing: 8,
      children: [
        for (final stat in AppCatalog.heroStats)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 12 : 16,
              vertical: compact ? 10 : 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  stat.value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: compact ? 18 : 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  stat.label,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.78),
                    fontSize: compact ? 11 : 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
