import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Root {
  Root({
    this.id,
    this.name,
    this.contacts,
    this.url,
  });

  factory Root.fromJson(Map<String, dynamic> jsonRes) => Root(
        id: asT<String?>(jsonRes['id']),
        name: asT<String?>(jsonRes['name']),
        contacts: asT<String?>(jsonRes['Contacts']),
        url: asT<String?>(jsonRes['url']),
      );

  String? id;
  String? name;
  String? contacts;
  String? url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'Contacts': contacts,
        'url': url,
      };

  Root clone() =>
      Root.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
