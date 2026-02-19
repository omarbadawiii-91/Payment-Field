import 'item.dart';

class Items {
  List<ItemModel>? items;

  Items({this.items});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
