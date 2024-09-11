/// id : 1
/// name : "vrushbah"
/// email : "vrushabh@gmail.com"
/// number : "1234567890"
/// dob : "29/08/2024"

class ContactModel {
  ContactModel({
      num? id, 
      String? name, 
      String? email, 
      String? number, 
      String? dob,}){
    _id = id;
    _name = name;
    _email = email;
    _number = number;
    _dob = dob;
}

  ContactModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _number = json['number'];
    _dob = json['dob'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _number;
  String? _dob;
ContactModel copyWith({  num? id,
  String? name,
  String? email,
  String? number,
  String? dob,
}) => ContactModel(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  number: number ?? _number,
  dob: dob ?? _dob,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get number => _number;
  String? get dob => _dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['number'] = _number;
    map['dob'] = _dob;
    return map;
  }

}