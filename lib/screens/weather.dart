import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/widgets/weather_widgets.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is Fetchingsucess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 1.2 * kToolbarHeight, 30, 1.2 * kToolbarHeight),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(children: [
                    const WeatherAlign(),
                    const WeatherAlign2(),
                    const WeatherAlign3(),
                    const WeatherBackDropFilter(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            state.results[0].cityname,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const WeatherImage1(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.results[0].climate,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${state.results[0].temp.toString()} °C',
                            style: const TextStyle(
                              fontSize: 65,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                const WeatherTempMaxImage(),
                                const SizedBox(
                                    // width: 5,
                                    ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const WeatherTempMaxText(),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${state.results[0].tempmax.toString()} °C',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                              Row(children: [
                                const WeatherTempMinImage(),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const WeatherTempMinText(),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${state.results[0].tempmin.toString()} °C',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
