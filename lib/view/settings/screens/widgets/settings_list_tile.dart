import 'package:adv/core/exports/ui_exports.dart';

class SettingsListTile extends StatelessWidget {
  final Widget? leading;
  final String settingsName;
  final Widget? trailing;
  final VisualDensity? visualDensity; 

  const SettingsListTile({
    super.key,
    this.leading,
    required this.settingsName,
    this.trailing,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: visualDensity,
      leading: leading,
      title: Text(settingsName, style: AppTextStyles.hintText(context)),
      trailing: trailing,
      onTap: () {},
    );
  }
}
