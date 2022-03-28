/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_list_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PolicyPresentationListBloc extends Bloc<PolicyPresentationListEvent, PolicyPresentationListState> {
  final PolicyPresentationRepository _policyPresentationRepository;
  StreamSubscription? _policyPresentationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int policyPresentationLimit;

  PolicyPresentationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PolicyPresentationRepository policyPresentationRepository, this.policyPresentationLimit = 5})
      : assert(policyPresentationRepository != null),
        _policyPresentationRepository = policyPresentationRepository,
        super(PolicyPresentationListLoading());

  Stream<PolicyPresentationListState> _mapLoadPolicyPresentationListToState() async* {
    int amountNow =  (state is PolicyPresentationListLoaded) ? (state as PolicyPresentationListLoaded).values!.length : 0;
    _policyPresentationsListSubscription?.cancel();
    _policyPresentationsListSubscription = _policyPresentationRepository.listen(
          (list) => add(PolicyPresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * policyPresentationLimit : null
    );
  }

  Stream<PolicyPresentationListState> _mapLoadPolicyPresentationListWithDetailsToState() async* {
    int amountNow =  (state is PolicyPresentationListLoaded) ? (state as PolicyPresentationListLoaded).values!.length : 0;
    _policyPresentationsListSubscription?.cancel();
    _policyPresentationsListSubscription = _policyPresentationRepository.listenWithDetails(
            (list) => add(PolicyPresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * policyPresentationLimit : null
    );
  }

  Stream<PolicyPresentationListState> _mapAddPolicyPresentationListToState(AddPolicyPresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _policyPresentationRepository.add(value);
  }

  Stream<PolicyPresentationListState> _mapUpdatePolicyPresentationListToState(UpdatePolicyPresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _policyPresentationRepository.update(value);
  }

  Stream<PolicyPresentationListState> _mapDeletePolicyPresentationListToState(DeletePolicyPresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _policyPresentationRepository.delete(value);
  }

  Stream<PolicyPresentationListState> _mapPolicyPresentationListUpdatedToState(
      PolicyPresentationListUpdated event) async* {
    yield PolicyPresentationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PolicyPresentationListState> mapEventToState(PolicyPresentationListEvent event) async* {
    if (event is LoadPolicyPresentationList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPolicyPresentationListToState();
      } else {
        yield* _mapLoadPolicyPresentationListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPolicyPresentationListWithDetailsToState();
    } else if (event is PolicyPresentationChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPolicyPresentationListToState();
      } else {
        yield* _mapLoadPolicyPresentationListWithDetailsToState();
      }
    } else if (event is AddPolicyPresentationList) {
      yield* _mapAddPolicyPresentationListToState(event);
    } else if (event is UpdatePolicyPresentationList) {
      yield* _mapUpdatePolicyPresentationListToState(event);
    } else if (event is DeletePolicyPresentationList) {
      yield* _mapDeletePolicyPresentationListToState(event);
    } else if (event is PolicyPresentationListUpdated) {
      yield* _mapPolicyPresentationListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _policyPresentationsListSubscription?.cancel();
    return super.close();
  }
}


