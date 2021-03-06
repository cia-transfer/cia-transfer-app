library c_type_sizes;

import 'src/bindings/bindings.dart';

/// A Calculator.
class Ctypes {
  static int sizeofSize_t(){
    return bindings.get_size_of_size_t();
  }

  static int sizeofInt(){
    return bindings.get_size_of_int();
  }

  static int sizeofUnsignedChar(){
    return bindings.get_size_of_unsigned_char();
  }

  static int sizeofUnsignedLongLong(){
    return bindings.get_size_of_unsigned_long_long();
  }
}
