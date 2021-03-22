import 'package:dentalstation_app/Models/ProductModel.dart';
import 'package:riverpod/riverpod.dart';

class Cart extends Product {
  int itemQuantity;

  Cart({id, name, price, oldPrice, image,  this.itemQuantity})
      : super(
            id: id, name: name, price: price, oldPrice: oldPrice, image: image);

  factory Cart.fromJson(Map<String, dynamic> json) {
    final product = Product.fromJson(json);
    final itemQuantity = json["itemQuantity"];
    return Cart(
        id: product.id,
        name: product.name,
        price: product.price,
        oldPrice: product.oldPrice,
        image: product.image,
        itemQuantity: itemQuantity);
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['id']=this.id;
    data['name']=this.name;
    data['price']=this.price;
    data['oldPrice']=this.oldPrice;
    data['image']=this.image;
    data['itemQuantity']=this.itemQuantity;
    return data;
  }
}


class CartList extends StateNotifier<List<Cart>>{

  CartList(List<Cart> state) : super(state??[]);

  void addAll(List<Cart> carts){
    state.addAll(carts);
  }

  void add(Cart cart){
    state=[
      ...state,
      cart
    ];
  }

  void edit(Cart cart,int itemQuantity){
    state = [
      for(final cartItem in state)
        if(cartItem.id==cart.id)
          Cart(
              id: cart.id,
              name: cart.name,
              price: cart.price,
              image: cart.image,
              itemQuantity: cartItem.itemQuantity + itemQuantity
          )
        else cartItem,
    ];

  }

  void remove(Cart removeItem){
    state=state.where((cart) => cart.id !=removeItem.id).toList();
  }
  void removeAll(){
    state=[];
  }
  double sumCart(){
    double result=0;
    for(final cartItem in state)
      result+=(cartItem.itemQuantity*cartItem.price);
    return result;
  }
}