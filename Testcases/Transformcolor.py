def transform_RGB_to_HEX(arg1):
    hex_result = "".join([format(val, '02X') for val in arg1])
    return hex_result