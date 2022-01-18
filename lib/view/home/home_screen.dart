import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 0;

  void changeCounter(int value) {
    setState(() => counter += value);
  }

  void resetCounter() {
    setState(() => counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    const textSize = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clicks counter:',
              style: textSize,
            ),
            Text(
              '$counter',
              style: textSize,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomNavBar(
        resetCounterFunction: resetCounter,
        changeCounterValueFunction: changeCounter,
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final Function resetCounterFunction;
  final Function changeCounterValueFunction;

  const CustomNavBar({
    Key? key,
    required this.resetCounterFunction,
    required this.changeCounterValueFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () => changeCounterValueFunction(-1)),
        FloatingActionButton(
            child: const Icon(Icons.exposure_zero_outlined),
            onPressed: () => resetCounterFunction()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_rounded),
            onPressed: () => changeCounterValueFunction(1)),
      ],
    );
  }
}
