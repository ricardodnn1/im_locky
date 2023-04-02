import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_lucky/app/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Gerador de números dinamico!'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .70,
                child: Center(
                  child: Text(
                    'Sugestão de jogo com 15 numeros na LOTOFACIL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      value: controller.selectDrawnNumbers,
                      items: controller.listDrawnNumbers.map((number) {
                        return DropdownMenuItem(
                          value: number,
                          child: Text('$number'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.setDrawnNumbers(value!);
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('de'),
                  const SizedBox(
                    width: 15,
                  ),
                  DropdownButton(
                    value: controller.selectListNumbers,
                    items: controller.listNumbers.map(
                      (number) {
                        return DropdownMenuItem(
                          value: number,
                          child: Text('$number'),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      controller.setListNumbers(value!);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  ...controller.drawnNumbers.map(
                    (e) => Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          e.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: size.width * .70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    await controller.raffle();
                  },
                  child: const Text('Gerar números'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
