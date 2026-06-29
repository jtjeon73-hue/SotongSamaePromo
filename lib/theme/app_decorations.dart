import 'package:flutter/material.dart';

import 'app_colors.dart';

/// 카드·섹션 공통 장식
abstract final class AppDecorations {
  static List<BoxShadow> get cardShadow => const [
        BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 2)),
        BoxShadow(color: Color(0x0F000000), blurRadius: 24, offset: Offset(0, 12)),
      ];

  static List<BoxShadow> get elevatedShadow => const [
        BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 8)),
        BoxShadow(color: Color(0x24000000), blurRadius: 40, offset: Offset(0, 24)),
      ];

  static BoxDecoration surfaceCard({
    Color? accent,
    double radius = 28,
    bool highlightTop = false,
  }) {
    return BoxDecoration(
      color: AppColors.creamSurface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: highlightTop && accent != null
            ? accent.withValues(alpha: 0.35)
            : AppColors.warmBorder,
      ),
      boxShadow: cardShadow,
    );
  }

  static BoxDecoration iconBadge(Color accent, {double radius = 18}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          accent.withValues(alpha: 0.18),
          accent.withValues(alpha: 0.06),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: accent.withValues(alpha: 0.2)),
    );
  }

  static BoxDecoration sectionTint(Color base) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [base.withValues(alpha: 0.5), AppColors.cream],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
