import 'package:intl/intl.dart';

extension CurrencyExtenstion on num? {
  get cEnFormat => NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
      ).format(this);

  get numberFormat => NumberFormat('#,##0.00').format(this);
}
