part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class Fetchingsucess extends WeatherState {
  final List<weathermodel> results;
  Fetchingsucess(this.results);
}

final class Fetchingfailure extends WeatherState {}
