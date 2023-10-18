import 'package:animated_pizza_app/const.dart';
import 'package:animated_pizza_app/model/pizza_model.dart';
import 'package:animated_pizza_app/utils.dart';
import 'package:flutter/material.dart';

class PizzaDetails extends StatefulWidget {
  final PizzaModel pizzaModel;

  const PizzaDetails({super.key, required this.pizzaModel});

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  double _rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    _startRotation();
  }

  void _startRotation() {
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _rotationAngle += 1;
        if (_rotationAngle >= 360) {
          _rotationAngle = 0;
        }
        _startRotation();
      });
    });
  }

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth(context),
          height: screenHeigth(context),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey.shade400,
                      )
                    ]),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 14)),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Hero(
                  tag: "pizza-details",
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(_rotationAngle / 360),
                      child: Image.asset(
                        widget.pizzaModel.img,
                        scale: 2.1,
                      ))),
            ),
            const Spacer(),
            Container(
              width: screenWidth(context),
              height: screenHeigth(context) / 2,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 200,
                        child: Text(
                          widget.pizzaModel.description,
                          style: const TextStyle(fontSize: 18),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${widget.pizzaModel.price.toString()}",
                          style:
                              const TextStyle(fontSize: 18, color: activeColor),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (total > 0) {
                                    total--;
                                  }
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "$total",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  total++;
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: activeColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4.3",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 14,
                              color: activeColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "10 min",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.hot_tub,
                              size: 14,
                              color: activeColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "328 kcal",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                   const SizedBox(height: 15,),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                      ),
                    ),
                      const SizedBox(height: 15,),
                    Container(
                      width: screenWidth(context),
                      height: 48,
                      decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Adicionar o carrinho",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
