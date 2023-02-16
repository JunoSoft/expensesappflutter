class Transaction {
  final String title;
  final String id;
  final double amount;
  DateTime date;
  Transaction(
      {required this.amount,
      required this.date,
      required this.id,
      required this.title});
}
