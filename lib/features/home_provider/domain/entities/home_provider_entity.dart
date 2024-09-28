class HomeProviderEntity {
  List<dynamic>? exhibts = [];
  int? pending;
  int? inProgress;
  int? completed;
  int? canceled;
  HomeProviderEntity({
    this.exhibts,
    this.pending,
    this.inProgress,
    this.completed,
    this.canceled,
  });
}
