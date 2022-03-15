import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class PolicyPresentationState extends Equatable {
  const PolicyPresentationState();

  @override
  List<Object?> get props => [];
}

class PolicyPresentationUninitialised extends PolicyPresentationState {
  @override
  List<Object?> get props => [];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is PolicyPresentationUninitialised;
}

class PolicyPresentationInitialised extends PolicyPresentationState {
  final PolicyPresentationModel model;
  final List<PublicMediumModel> media;

  PolicyPresentationInitialised(this.model, this.media);

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is PolicyPresentationInitialised &&
          model == other.model &&
          ListEquality().equals(media, other.media);
}

