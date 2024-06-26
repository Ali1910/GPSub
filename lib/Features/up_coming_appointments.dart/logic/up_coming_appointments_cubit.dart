import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/repo/upcoming_repo.dart';

class UpComingAppointmentsCubit extends Cubit<AppointmentHistory> {
  UpComingAppointmentsCubit(this._repo) : super(UpComingAppointmentsInitial());

  final UpcomingRepo _repo;

  Future<void> fetchAppointments(int userid) async {
    emit(UpComingAppointmentsFetchingLoading());
    var response = await _repo.fetchUPcomingAppointments(userid);
    response.fold(
      (failure) => emit(
        UpComingAppointmentsFetchingFailed(failure.errMessage),
      ),
      (success) => emit(
        UpComingAppointmentsFetchingSucceeded(success),
      ),
    );
  }

  late bool value;

  Future<bool> deleteAppointMents(int appointmentId) async {
    var response = await _repo.deleteUpcomingappointmnet(appointmentId);
    response.fold(
      (l) {
        value = false;
      },
      (r) {
        value = true;
      },
    );
    return value;
  }
}
