import '../models/times.dart';
import '../models/titulo.dart';
import '../repository/times_repository.dart';



class HomeController{
  TimesRepository timesrepository = TimesRepository();

  List<Time> get tabela => timesrepository.times;

  HomeController() {
    timesrepository = TimesRepository();

}

}