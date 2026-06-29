import 'package:flutter/material.dart';

import '../data/app_catalog.dart';
import '../theme/app_colors.dart';
import '../theme/app_layout.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    super.key,
    required this.onAnchorTap,
    required this.onNotifyTap,
  });

  final void Function(String anchor) onAnchorTap;
  final VoidCallback onNotifyTap;

  @override
  Widget build(BuildContext context) {
    final showMenu = AppLayout.isWide(context);
    final isMobile = AppLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.horizontalPadding(context),
        vertical: isMobile ? 12 : 16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.creamSurface,
        border: Border(bottom: BorderSide(color: AppColors.warmBorder)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Row(
            children: [
              InkWell(
                onTap: () => onAnchorTap('top'),
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.spa_outlined, color: AppColors.olive, size: 22),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppCatalog.brandName,
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (!isMobile)
                          Text(
                            AppCatalog.siteName,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textMuted.withValues(alpha: 0.9),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (showMenu)
                for (final item in AppCatalog.navItems)
                  _NavLink(
                    label: item.label,
                    onTap: () => onAnchorTap(item.anchor),
                  ),
              if (!showMenu)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
                  onSelected: onAnchorTap,
                  itemBuilder: (context) => [
                    for (final item in AppCatalog.navItems)
                      PopupMenuItem(value: item.anchor, child: Text(item.label)),
                  ],
                ),
              SizedBox(width: isMobile ? 4 : 12),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 14 : 18,
                    vertical: isMobile ? 10 : 12,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: onNotifyTap,
                child: Text(isMobile ? '알림' : '출시 알림'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
