class LeadModel{
  final String id;
  final String name;
  final String earningOpportunity;
  final int servicesSold;
  final List<String> products;
  final String? status;
  final String? actionRequired;
  final String? bankLastUpdated;
  final String? nextUpdateExpected;
  final int? delayedDays;

  LeadModel({
    required this.id,
    required this.name,
    required this.earningOpportunity,
    required this.servicesSold,
    required this.products,
    required this.status,
    this.actionRequired,
    this.bankLastUpdated,
    this.nextUpdateExpected,
    this.delayedDays,
  });
}

class TabInfo {
  final String id;
  final String label;
  final int count;

  TabInfo({
    required this.id,
    required this.label,
    required this.count,
  });
}