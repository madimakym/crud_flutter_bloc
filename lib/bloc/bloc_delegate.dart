import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocObserver {
  // @override
  // void onEvent(Bloc bloc, Object event) {
  //   super.onEvent(bloc, event);
  //   print(event);
  // }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   print(transition);
  // }

  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   super.onError(cubit, error, stackTrace);
  // }

  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}