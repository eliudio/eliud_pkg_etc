import 'etc_package.dart';

class EtcWebPackage extends EtcPackage {

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is EtcWebPackage &&
              runtimeType == other.runtimeType;

}
