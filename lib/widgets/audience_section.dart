import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_layout.dart';

class AudienceSection extends StatelessWidget {
  const AudienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    if (isMobile) {
      return SizedBox(
        height: 148,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.horizontalPadding(context)),
          scrollDirection: Axis.horizontal,
          itemCount: AppCatalog.audienceSegments.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final seg = AppCatalog.audienceSegments[index];
            return SizedBox(
              width: 260,
              child: _AudienceCard(segment: seg, compact: true),
            );
          },
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.horizontalPadding(context),
        vertical: 8,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: ResponsiveAudienceGrid(
            children: [
              for (final seg in AppCatalog.audienceSegments)
                _AudienceCard(segment: seg),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveAudienceGrid extends StatelessWidget {
  const ResponsiveAudienceGrid({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900 ? 4 : 2;
        final width = (constraints.maxWidth - 12 * (columns - 1)) / columns;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [for (final c in children) SizedBox(width: width, child: c)],
        );
      },
    );
  }
}

class _AudienceCard extends StatelessWidget {
  const _AudienceCard({required this.segment, this.compact = false});

  final AudienceSegment segment;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 16 : 20),
      decoration: AppDecorations.surfaceCard(accent: AppColors.green),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: AppDecorations.iconBadge(AppColors.deepGreen, radius: 12),
                child: Icon(segment.icon, size: 18, color: AppColors.deepGreen),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  segment.label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepGreen,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 12 : 14),
          Text(
            segment.headline,
            style: TextStyle(
              fontSize: compact ? 14 : 15,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            segment.description,
            style: TextStyle(
              fontSize: compact ? 12 : 13,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
