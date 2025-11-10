class UserModel {
  final String id;
  final String name;
  final String profession;
  final String about;
  final String email;
  final String phone;
  final String linkedIn;

  UserModel({
    required this.id,
    required this.name,
    required this.profession,
    required this.about,
    required this.email,
    required this.phone,
    required this.linkedIn,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      profession: json['profession'],
      about: json['about'],
      email: json['email'],
      phone: json['phone'],
      linkedIn: json['linkedIn'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profession': profession,
    'about': about,
    'email': email,
    'phone': phone,
    'linkedIn': linkedIn,
  };

  UserModel copyWith({
    String? id,
    String? name,
    String? profession,
    String? about,
    String? email,
    String? phone,
    String? linkedIn,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      profession: profession ?? this.profession,
      about: about ?? this.about,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      linkedIn: linkedIn ?? this.linkedIn,
    );
  }
}
