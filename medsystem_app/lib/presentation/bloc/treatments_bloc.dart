import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/data/remote/treatments_service.dart';
import 'package:medsystem_app/domain/treatment.dart';
import 'package:medsystem_app/presentation/bloc/treatments_event.dart';
import 'package:medsystem_app/presentation/bloc/treatments_state.dart';

class TreatmentsBloc extends Bloc<TreatmentsEvent, TreatmentsState> {
  TreatmentsBloc() : super(TreatmentsInitialState()) {
    on<GetTreatments>((event, emit) async {
      emit(TreatmentsLoadingState());
      try {
        List<Treatment> treatments = await TreatmentsService().getTreatments();
        emit(TreatmentsLoadedState(treatments: treatments));
      } catch (e) {
        emit(TreatmentsErrorState(message: e.toString()));
      }
    });

    on<AddTreatment>((event, emit) async {
      emit(TreatmentsLoadingState());
      try {
        Treatment? treatment = await AddTreatmentService().postTreatments(
          event.treatmentName,
          event.description,
          event.startDate,
          event.endDate,
          event.patientId.toString(),
        );
        if (treatment != null) {
          emit(TreatmentsAddedState(treatment: treatment));
        } else {
          emit(TreatmentsErrorState(message: 'Error adding treatment'));
        }
      } catch (e) {
        emit(TreatmentsErrorState(message: e.toString()));
      }
    });
  }
}
