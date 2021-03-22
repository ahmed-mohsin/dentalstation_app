import 'package:dentalstation_app/Models/Cart.dart';
import 'package:riverpod/riverpod.dart';

final cartListProvider= StateNotifierProvider((ref)=>CartList([]));