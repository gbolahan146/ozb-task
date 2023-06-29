import 'package:ozb_app/product_detail_widget.dart';
import 'package:ozb_app/widgets/product_tile_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/state/cart_state.dart';
import '../models/product.dart';
import 'product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
      bool isGridView = cartState.isGridView;
      if (isGridView) {
        return LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ProductTileAnimation(
              itemNo: index,
              product: products[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
              childAspectRatio: 1,
            ),
          );
        });
      } else {
        return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductTileAnimation(
                itemNo: index,
                product: products[index],
              );
            });
      }
    });

  }
}
