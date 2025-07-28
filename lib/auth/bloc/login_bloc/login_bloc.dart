import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../utils/login_form_validator.dart'; 

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>(_onLoginInitial);
    on<LoginLoadingEvent>((event, emit) => emit(LoginLoadingState()));
    on<LoginSuccessEvent>((event, emit) => emit(LoginSuccessState()));
    on<LoginFailureEvent>(
      (event, emit) => emit(LoginFailureState(error: event.error)),
    );
  }

  Future<void> _onLoginInitial(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2)); 

    final errors = LogInValidator.validateLogInFields(
      password: event.password,
    );

    if (event.username.isEmpty) {
      emit(LoginFailureState(error: "Username is required"));
    } else if (errors.isNotEmpty) {
      emit(LoginFailureState(error: errors.values.first));
    } else {
      emit(LoginSuccessState());
    }
  }
}
