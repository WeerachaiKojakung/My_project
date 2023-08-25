class Employee {
  String? id; // Nullable
  String firstName;
  String lastName;
 
  Employee({this.id, required this.firstName, required this.lastName});
 
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }
}
