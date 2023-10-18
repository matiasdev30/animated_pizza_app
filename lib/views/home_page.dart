import 'package:animated_pizza_app/model/food_model.dart';
import 'package:animated_pizza_app/model/pizza_model.dart';
import 'package:animated_pizza_app/utils.dart';
import 'package:animated_pizza_app/views/pizza_details.dart';
import 'package:flutter/material.dart';
import 'package:animated_pizza_app/const.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<FoodModel> foodsType = [
    FoodModel(emoji: "🌮", description: "Comida rapida"),
    FoodModel(emoji: "🥕", description: "Comida saudavel"),
    FoodModel(emoji: "🥒", description: "Vegana"),
    FoodModel(emoji: "🍻", description: "Cerveja e sumo"),
    FoodModel(emoji: "➕", description: "Outros"),
  ];

  List<PizzaModel> pizzaList = [
    PizzaModel(
        description: "Meaty Pizza com bife",
        price: 6.30,
        img: "assets/pizzas/pizza1.png"),
    PizzaModel(
        description: "Pizza familiar com tomate",
        price: 7.6,
        img: "assets/pizzas/pizza2.png"),
    PizzaModel(
        description: "Pizza singular",
        price: 2.6,
        img: "assets/pizzas/pizza3.png"),
    PizzaModel(
        description: "Pizza Italiana, com cogumelo",
        price: 4.6,
        img: "assets/pizzas/pizza4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeigth(context),
        width: screenWidth(context),
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 40, right: 40, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Encotre\nSua melhor\nComida",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: screenWidth(context),
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Procurar",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40, right: 0),
              height: 50,
              width: screenWidth(context),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    foodsType.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: index == currentIndex
                                ? activeColor
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Text(
                              "${foodsType[index].emoji} ${foodsType[index].description}",
                              style: TextStyle(
                                  color: index == currentIndex
                                      ? Colors.white
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              height: screenHeigth(context) * .4,
              width: screenWidth(context),
              child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      pizzaList.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PizzaDetails(
                                      pizzaModel: pizzaList[index]),
                                  fullscreenDialog: true));
                        },
                        child: Container(
                          width: 240,
                          height: 44,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          pizzaList[index].description,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "\$",
                                            style: TextStyle(
                                                color: activeColor,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            pizzaList[index].price.toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Colors.yellow,
                                          ),
                                          const Text(
                                            "4.3",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (currentIndex == index )...[
                                  
                                  Positioned(
                                      top: -40,
                                      right: -70,
                                      child: Hero(
                                        tag: "pizza-details",
                                        child: Image.asset(
                                          pizzaList[index].img,
                                          scale: 2.2,
                                        ),
                                      ),
                                )]else...[
                                      Positioned(
                                    top: -40,
                                    right: -70,
                                    child: Image.asset(
                                      pizzaList[index].img,
                                      scale: 2.2,
                                    ))
                                    ]
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
