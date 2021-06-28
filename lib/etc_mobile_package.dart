import 'etc_package.dart';

class EtcMobilePackage extends EtcPackage {

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is EtcMobilePackage &&
              runtimeType == other.runtimeType;
}
