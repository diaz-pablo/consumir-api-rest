class Validate {
  Map data;
  Validate(this.data);

  checkKeyExists(String key, var valueDefault) {
    return (data.containsKey(key) && data[key] != null) ? validateType(data[key], valueDefault) : valueDefault;
  }

  validateType(var value, var valueDefault) {
    switch(valueDefault.runtimeType) {
      case int: return int.parse(value.toString());
      case String: return value.toString();
      case double: return double.parse(value.toString());
      case bool: return bool.parse(value.toString());
      default: return value;
    }
  }
}