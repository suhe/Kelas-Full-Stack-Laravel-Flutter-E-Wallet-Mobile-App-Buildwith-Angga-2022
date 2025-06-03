import 'package:bank_sha/models/sign_in_form_model.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/services/user_service.dart';
import 'package:bank_sha/services/walet_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      //auth check emal
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(AuthFailed("Email sudah terpakai"));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //auth register
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //auth login
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //get current user
      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //update user
      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copyWith(
              username: event.data.username,
              name: event.data.name,
              email: event.data.email,
              password: event.data.password,
            );

            emit(AuthLoading());

            await UserService().updateUser(event.data);

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //update pin
      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copyWith(
              pin: event.newPin,
            );

            emit(AuthLoading());

            await WaletService().updatePin(event.oldPin, event.newPin);

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //loogut
      if (event is AuthLogout) {
        try {
          emit(AuthLoading());

          await AuthService().logout();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      //update balance
      if (event is AuthUpdateBalance) {
        if (state is AuthSuccess) {
          final currentUser = (state as AuthSuccess).user;
          final updateUser = currentUser.copyWith(
            balance: currentUser.balance! + event.amount,
          );

          emit(AuthSuccess(updateUser));
        }
      }
    });
  }
}
