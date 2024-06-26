import 'package:core_module/core_module.dart';

import 'package:coopartilhar/app/features/ask_help/data/repositories/i_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';

class AskHelpController extends BaseController {
  AskHelpController({required IAskHelpRepository repository})
      : _repository = repository,
        super(InitialState());

  final IAskHelpRepository _repository;

  Future<void> saveSolicitation({
    required SolicitationEntity solicitation,
  }) async {
    update(LoadingState());

    final result = await _repository.saveSolicitation(solicitation);

    result.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (success) => update(SuccessState(data: success)),
    );
  }
}
