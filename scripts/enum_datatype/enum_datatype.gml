// Gamemaker types as an enum
enum DataType {
	UNKNOWN,
	STRING,
	NUMBER,
	BOOL,
	ARRAY,
	STRUCT
}


// Usage Example: if (datatype_of(_val) != DataType.STRING)
function datatype_of (_value)
{
	var _type = typeof(_value);
    switch (_type)
	{
        case "string":  return DataType.STRING;
        case "number":  return DataType.NUMBER;
        case "bool":    return DataType.BOOL;
        case "array":   return DataType.ARRAY;
        case "struct":  return DataType.STRUCT;
        default:        return DataType.UNKNOWN;
    }
}
