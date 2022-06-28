part of 'package:crackit/app.dart';


class SampleTable {
  String? next;
  String? previous;
  List<Results>? results;

  SampleTable({this.next, this.previous, this.results});

  SampleTable.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? verified;

  Results(
      {this.firstName, this.lastName, this.email, this.phone, this.verified});

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['verified'] = verified;
    return data;
  }
}
