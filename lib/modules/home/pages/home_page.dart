import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/shared/controllers/academic_year_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final academicYearController = Modular.get<AcademicYearController>();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    academicYearController.getHigh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          academicYearController.isLoading,
          academicYearController.error,
          academicYearController.stateHigh,
        ]),
        builder: (context, snapshot) {
          if (academicYearController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (academicYearController.error.value.isNotEmpty) {
            return Center(
              child: Text(
                academicYearController.error.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          var academicYear = academicYearController.stateHigh.value;

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recente',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card.filled(
                            child: SizedBox(
                              height: 120,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card.filled(
                            child: SizedBox(
                              height: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card.filled(
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(academicYear.ano_letivo.toString()),
                    const Text(
                      'Notícias',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Card.filled(
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                      ),
                    ),
                    Card.filled(
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                      ),
                    ),
                    Card.filled(
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
