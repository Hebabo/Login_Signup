import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../utils/signup_form_validator.dart'; 

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<SignupInitialEvent>(_onSignupInitial);
    on<SignupLoadingEvent>((event, emit) => emit(SignupLoadingState()));
    on<SignupSuccessEvent>((event, emit) => emit(SignupSuccessState()));
    on<SignupFailureEvent>(
      (event, emit) => emit(SignupFailureState(error: event.error)),
    );
  }

  Future<void> _onSignupInitial(
    SignupInitialEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoadingState());

    await Future.delayed(const Duration(seconds: 2)); 

    final errors = SignUpValidator.validateSignUpFields(
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    if (event.username.isEmpty) {
      emit(SignupFailureState(error: "Username is required"));
    } else if (errors.isNotEmpty) {
      emit(SignupFailureState(error: errors.values.first));
    } else {
      emit(SignupSuccessState());
    }
  }
}
