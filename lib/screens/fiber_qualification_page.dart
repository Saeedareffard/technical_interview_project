import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_question/controllers/location_product_qualification_controller.dart';
import 'package:technical_question/screens/widgets/availability_chip.dart';
import 'package:technical_question/screens/widgets/image_placeholder.dart';
import 'package:technical_question/screens/widgets/info_button_stacked.dart';
import 'package:technical_question/screens/widgets/label_with_text.dart';
import 'package:technical_question/screens/widgets/product_list.dart';

class FiberQualificationPage extends HookConsumerWidget {
  const FiberQualificationPage({super.key, required this.locationId});
  final String locationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qualificationAsync =
        ref.watch(locationProductQualificationControllerProvider(locationId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fiber 1000 Qualification'),
      ),
      body: qualificationAsync.when(
        data: (qualification) {
          return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: addVerticalSpacing(
                  [
                    LabelWithText(
                      label: 'Address:',
                      text: qualification.address,
                    ),
                    Tooltip(
                      message: 'Aerial view',
                      triggerMode: TooltipTriggerMode.tap,
                      child: InfoButtonStacked(
                        child: ImagePlaceholder(
                          imageUrl: qualification.aerialImageUrl,
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'Boundary view',
                      triggerMode: TooltipTriggerMode.tap,
                      child: InfoButtonStacked(
                        child: ImagePlaceholder(
                          imageUrl: qualification.boundaryImageUrl,
                        ),
                      ),
                    ),
                    AvailabilityChip(
                      isAvailable:
                          qualification.fiber1000EnabledProducts.isNotEmpty,
                    ),
                    Text(
                      'Fiber 1000 Enabled Products',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Divider(),
                    qualification.fiber1000EnabledProducts.isEmpty
                        ? _emptySection(context)
                        : ProductList(
                            qualification: qualification,
                          ),
                  ],
                ),
              ));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => _errorSection(err),
      ),
    );
  }

  List<Widget> addVerticalSpacing(List<Widget> children,
      {double spacing = 20.0}) {
    final spaced = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spaced.add(children[i]);
      if (i < children.length - 1) {
        spaced.add(SizedBox(height: spacing));
      }
    }
    return spaced;
  }

  Widget _emptySection(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'No Fiber 1000 products available.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _errorSection(Object err) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(height: 16),
          Text(
            'Error: $err',
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
