class ErrorEntity {
  ErrorEntity(
      {required this.detail,
      required this.instance,
      required this.status,
      required this.title});

  String title;
  int status;
  String detail;
  String instance;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) => ErrorEntity(
        detail: json["detail"],
        instance: json["instance"],
        status: json["status"],
        title: json["title"],
      );
}
