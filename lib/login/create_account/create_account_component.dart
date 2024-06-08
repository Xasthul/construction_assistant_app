import 'package:construction_assistant_app/login/create_account/create_account_dependencies.dart';
import 'package:flutter/material.dart';

class CreateAccountComponent extends StatelessWidget {
  const CreateAccountComponent({super.key});

  @override
  Widget build(BuildContext context) => const CreateAccountDependencies(
        child: _CreateAccountComponentBase(),
      );
}

class _CreateAccountComponentBase extends StatelessWidget {
  const _CreateAccountComponentBase();

  @override
  Widget build(BuildContext context) => const Placeholder();
}
