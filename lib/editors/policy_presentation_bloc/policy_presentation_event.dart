import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class PolicyPresentationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PolicyPresentationInitialise extends PolicyPresentationEvent {
  final PolicyPresentationModel model;

  PolicyPresentationInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PolicyPresentationInitialise &&
              model == other.model;
}

class PolicyPresentationApplyChanges extends PolicyPresentationEvent {
  final PolicyPresentationModel model;
  final List<PublicMediumModel>? media;

  PolicyPresentationApplyChanges(this.model, this.media);

  @override
  List<Object?> get props => [model, media];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PolicyPresentationApplyChanges &&
              model == other.model &&
              ListEquality().equals(media, other.media);
}

class NewPolicyPageEvent extends PolicyPresentationEvent {
  final PublicMediumModel newPage;

  NewPolicyPageEvent(this.newPage);

  @override
  List<Object?> get props => [newPage];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NewPolicyPageEvent &&
              newPage == other.newPage;
}

class DeletePolicyPageEvent extends PolicyPresentationEvent {
  final PublicMediumModel deletePage;

  DeletePolicyPageEvent(this.deletePage);

  @override
  List<Object?> get props => [deletePage];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DeletePolicyPageEvent &&
              deletePage == other.deletePage;
}