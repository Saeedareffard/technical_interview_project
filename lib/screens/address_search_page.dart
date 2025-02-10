import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_question/controllers/address_search_controller.dart';
import 'package:technical_question/screens/widgets/address_result_list.dart';

class AddressSearchPage extends HookConsumerWidget {
  const AddressSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final textController = useTextEditingController();
    final debounceTimer = useRef<Timer?>(null);

    useEffect(() {
      return () => debounceTimer.value?.cancel();
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('Address Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an address';
                  }
                  final tokens = value.trim().split(RegExp(r'\s+'));
                  if (tokens.length < 2) {
                    return 'Please enter more than just a number';
                  }
                  return null;
                },
                onChanged: (value) {
                  debounceTimer.value?.cancel();
                  if (!formKey.currentState!.validate()) return;
                  debounceTimer.value =
                      Timer(const Duration(milliseconds: 500), () {
                    ref
                        .read(addressSearchControllerProvider.notifier)
                        .searchAddress(value);
                  });
                },
              ),
              const SizedBox(height: 16),
              const Expanded(child: AddressResultList()),
            ],
          ),
        ),
      ),
    );
  }
}
