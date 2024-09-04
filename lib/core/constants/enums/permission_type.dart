enum PermissionType {
  assignDrinkDebt,
  viewDrinkDebtLog,
  changeAssociationInfo,
  inviteNewMembers,
  removeDrinkDebt,
  createAchievements,
}

extension PermissionTypeExtension on PermissionType {
  String get name {
    switch (this) {
      case PermissionType.assignDrinkDebt:
        return "Assign Drink Debt";
      case PermissionType.viewDrinkDebtLog:
        return "View Drink Debt Log";
      case PermissionType.changeAssociationInfo:
        return "Change Association Info";
      case PermissionType.inviteNewMembers:
        return "Invite New Members";
      case PermissionType.removeDrinkDebt:
        return "Remove Drink Debt";
      case PermissionType.createAchievements:
        return "Create Achievements";
    }
  }
}
