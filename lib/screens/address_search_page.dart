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
      appBar: AppBar(
        title: const Text(
          'Address Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check if fiber 1000 products are available for the chosen address',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: textController,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Enter address',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      hintText: 'e.g., 123 Taradale Road, Onekawa, Napier',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue.shade800),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      suffixIcon: value.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear,
                                  color: Colors.grey.shade600),
                              onPressed: () {
                                textController.clear();
                                ref
                                    .read(addressSearchControllerProvider
                                        .notifier)
                                    .searchAddress('');
                              },
                            )
                          : null,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an address';
                      }
                      final tokens = value.trim().split(RegExp(r'\s+'));
                      if (tokens.length < 2) {
                        return 'Invalid address (e.g., 123 Taradale Road, Onekawa, Napier, New Zealand)';
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
                  );
                },
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: AddressResultList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
