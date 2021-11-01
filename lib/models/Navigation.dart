// ignore_for_file: prefer_single_quotes

class NavitionItem {
  String titel;
  String icon;

  NavitionItem({required this.titel, required this.icon});
}

class NavitionItems {
  static NavitionItem home =
      NavitionItem(titel: "Dashbord", icon: "assets/icons/dashboard.svg");
  static NavitionItem doctors =
      NavitionItem(titel: "Doctors", icon: "assets/icons/doctor.svg");
  static NavitionItem appoinment =
      NavitionItem(titel: "Appointments", icon: "assets/icons/calendar.svg");
  static NavitionItem earning =
      NavitionItem(titel: "Earning", icon: "assets/icons/income.svg");
  static NavitionItem logout =
      NavitionItem(titel: "Logout", icon: "assets/icons/logout.svg");
  static List<NavitionItem> all = [home, doctors, appoinment, earning, logout];
}
