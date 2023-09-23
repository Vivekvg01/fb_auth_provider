import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String messgae;
  final String plugin;
  CustomError({
     this.code = '',
     this.messgae = '',
     this.plugin = '',
  });

  @override
  List<Object> get props => [code, messgae, plugin];

  @override
  String toString() =>
      'CustomError(code: $code, messgae: $messgae, plugin: $plugin)';
}
