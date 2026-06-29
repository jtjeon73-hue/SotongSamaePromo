import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';
import 'landing_section.dart';

class TourismSection extends StatelessWidget {
  const TourismSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    final spots = isMobile
        ? AppCatalog.tourismSpots.take(4).toList()
        : AppCatalog.tourismSpots;

    return LandingSection(
      anchorKey: sectionKey,
      eyebrow: 'VISIT SAMAE',
      title: '사매면 관광과 지역 매력',
      subtitle: '방문 전에 미리 살펴보고, 현장에서는 길찾기와 먹거리 정보까지 — 사매 여행이 한결 수월해집니다.',
      child: ResponsiveGrid(
        minCardWidth: isMobile ? 260 : 300,
        maxColumns: 2,
        spacing: isMobile ? 14 : 20,
        children: [
          for (final spot in spots)
            _TourismCard(spot: spot, compact: isMobile),
        ],
      ),
    );
  }
}

class _TourismCard extends StatelessWidget {
  const _TourismCard({required this.spot, this.compact = false});

  final TourismSpot spot;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: AppDecorations.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: compact ? 120 : 148,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: spot.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -8,
                  bottom: -8,
                  child: Icon(
                    spot.icon,
                    size: compact ? 72 : 96,
                    color: Colors.white.withValues(alpha: 0.16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(spot.icon, color: Colors.white, size: compact ? 22 : 26),
                      ),
                      const Spacer(),
                      if (spot.visitorNote != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            spot.visitorNote!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      Text(
                        spot.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: compact ? 17 : 20,
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(compact ? 16 : 20),
            color: AppColors.creamSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spot.summary,
                  style: TextStyle(
                    color: AppColors.textMuted,
                    height: 1.55,
                    fontSize: compact ? 13 : 14,
                  ),
                ),
                if (spot.location != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 16, color: AppColors.green),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          spot.location!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textOnGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
