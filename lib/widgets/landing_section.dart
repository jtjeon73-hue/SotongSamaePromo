import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.backgroundColor,
    this.backgroundDecoration,
    this.anchorKey,
    this.eyebrow,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Color? backgroundColor;
  final BoxDecoration? backgroundDecoration;
  final Key? anchorKey;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    final titleSize = AppLayout.titleSize(context);
    final vPad = AppLayout.sectionVerticalPadding(context);

    return Container(
      key: anchorKey,
      width: double.infinity,
      decoration: backgroundDecoration ??
          (backgroundColor != null ? BoxDecoration(color: backgroundColor) : null),
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.horizontalPadding(context),
        vertical: vPad,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (eyebrow != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    eyebrow!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.deepGreen,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: AppLayout.isMobile(context) ? 15 : 16,
                  color: AppColors.textMuted,
                  height: 1.65,
                ),
              ),
              SizedBox(height: AppLayout.isMobile(context) ? 22 : 32),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.accentColor = AppColors.green,
    this.audience,
    this.compact = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;
  final String? audience;
  final bool compact;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    final padding = compact || isMobile ? 18.0 : 24.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Ink(
          decoration: AppDecorations.surfaceCard(accent: accentColor, highlightTop: true),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(compact ? 10 : 12),
                      decoration: AppDecorations.iconBadge(accentColor),
                      child: Icon(icon, color: accentColor, size: compact ? 22 : 26),
                    ),
                    if (audience != null) ...[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          audience!,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: accentColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: compact ? 14 : 18),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: compact ? 16 : 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: compact ? 13 : 14,
                    color: AppColors.textMuted,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.minCardWidth = 280,
    this.spacing = 20,
    this.maxColumns = 4,
  });

  final List<Widget> children;
  final double minCardWidth;
  final double spacing;
  final int maxColumns;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = AppLayout.isMobile(context);
        final effectiveMin = mobile ? minCardWidth * 0.85 : minCardWidth;
        final columns =
            (constraints.maxWidth / effectiveMin).floor().clamp(1, maxColumns);
        final cardWidth = columns == 1
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing * (columns - 1)) / columns;
        final gap = mobile ? spacing * 0.75 : spacing;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final child in children)
              SizedBox(width: cardWidth, child: child),
          ],
        );
      },
    );
  }
}

class SubsectionLabel extends StatelessWidget {
  const SubsectionLabel({super.key, required this.title, this.trailing});

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppLayout.isMobile(context) ? 12 : 16),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppLayout.isMobile(context) ? 16 : 18,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (trailing != null)
            Text(
              trailing!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
        ],
      ),
    );
  }
}
