import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/features/appointments/data/remote/appointments_service.dart';
import 'package:medsystem_app/features/appointments/domain/appointment.dart';
import 'package:medsystem_app/features/appointments/presentation/blocs/appointments_event.dart';
import 'package:medsystem_app/features/appointments/presentation/blocs/appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState>{
  AppointmentsBloc(): super(AppointmentsInitialState()){
    on<GetAppointments>(
      (event, emit) async {
        emit(AppointmentsLoadingState());
        try{
          List<Appointment> appointments = await AppointmentsService().getAppointments();
          emit(AppointmentsLoadedState(appointments: appointments));
        } catch(e){
          emit(AppointmentsErrorState(message: e.toString()));
        }
      }
    );
  }
  
}