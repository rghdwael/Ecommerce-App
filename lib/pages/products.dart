import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{

  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 400
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Welcome to the product page!",
                  style: Theme.of(context).textTheme.headlineLarge,),
                  SizedBox(height: 5,),
                  Text("Browse our available products.",
                    style: Theme.of(context).textTheme.bodyMedium,)
                ]

            ),
          ),
        ),
      )
    ;
  }


}