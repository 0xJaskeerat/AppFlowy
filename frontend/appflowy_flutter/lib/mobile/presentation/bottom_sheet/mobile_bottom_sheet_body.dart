import 'package:appflowy/generated/flowy_svgs.g.dart';
import 'package:appflowy/generated/locale_keys.g.dart';
import 'package:appflowy/mobile/presentation/bottom_sheet/mobile_bottom_sheet_action_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum MobileViewItemBottomSheetBodyAction {
  rename,
  duplicate,
  share,
  delete,
  addToFavorites,
  removeFromFavorites,
}

class MobileViewItemBottomSheetBody extends StatelessWidget {
  const MobileViewItemBottomSheetBody({
    super.key,
    this.isFavorite = false,
    required this.onAction,
  });

  final bool isFavorite;
  final void Function(MobileViewItemBottomSheetBodyAction action) onAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // rename, duplicate
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BottomSheetActionWidget(
                svg: FlowySvgs.m_rename_m,
                text: LocaleKeys.button_rename.tr(),
                onTap: () => onAction(
                  MobileViewItemBottomSheetBodyAction.rename,
                ),
              ),
            ),
            Expanded(
              child: BottomSheetActionWidget(
                svg: FlowySvgs.m_duplicate_m,
                text: LocaleKeys.button_duplicate.tr(),
                onTap: () => onAction(
                  MobileViewItemBottomSheetBodyAction.duplicate,
                ),
              ),
            ),
          ],
        ),

        // share, delete
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BottomSheetActionWidget(
                svg: FlowySvgs.m_share_m,
                text: LocaleKeys.button_share.tr(),
                onTap: () => onAction(
                  MobileViewItemBottomSheetBodyAction.share,
                ),
              ),
            ),
            Expanded(
              child: BottomSheetActionWidget(
                svg: FlowySvgs.m_delete_m,
                text: LocaleKeys.button_delete.tr(),
                onTap: () => onAction(
                  MobileViewItemBottomSheetBodyAction.delete,
                ),
              ),
            ),
          ],
        ),

        // remove from favorites

        BottomSheetActionWidget(
          svg: isFavorite
              ? FlowySvgs.m_favorite_selected_lg
              : FlowySvgs.m_favorite_unselected_lg,
          text: isFavorite
              ? LocaleKeys.button_removeFromFavorites.tr()
              : LocaleKeys.button_addToFavorites.tr(),
          onTap: () => onAction(
            isFavorite
                ? MobileViewItemBottomSheetBodyAction.removeFromFavorites
                : MobileViewItemBottomSheetBodyAction.addToFavorites,
          ),
        )
      ],
    );
  }
}
