// ignore_for_file: prefer_single_quotes

class NavitionItem {
  String titel;
  String icon;
  String type;
  NavitionItem({
    required this.titel,
    required this.icon,
    required this.type,
  });
}

class NavitionItems {
  static NavitionItem home = NavitionItem(
      titel: "Dashbord", icon: "assets/icons/menu.svg", type: "food");
  static NavitionItem foodMenu =
      NavitionItem(titel: "Menu ", icon: "assets/icons/food.svg", type: "food");
  static NavitionItem order = NavitionItem(
      titel: "Orders", icon: "assets/icons/bill.svg", type: "food");
  static NavitionItem inventory = NavitionItem(
      titel: "Inventory", icon: "assets/icons/inventory.svg", type: "food");
  static NavitionItem manage = NavitionItem(
      titel: "Manage", icon: "assets/icons/settings.svg", type: "all");

  static List<NavitionItem> all = [home, order, foodMenu, inventory, manage];
}
