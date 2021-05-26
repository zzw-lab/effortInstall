from ctypes import *
import struct

"""
    函数说明：进制转换类
"""

# float 转 16进制（hex）
def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

# float 转 16进制（hex）
def float_convert_hex(s):
    i = int(s, 16)  # convert from hex to a Python int
    cp = pointer(c_int(i))  # make this into a c integer
    fp = cast(cp, POINTER(c_float))  # cast the int pointer to a float pointer
    return fp.contents.value  # dereference the pointer, get the float

# 16进制（hex）转 float
def hex_to_float(f):
    return (struct.unpack('!f', bytes.fromhex(f))[0])


# str_float = 65.0
# str_hex = '42820000'
# str_ascii = 'A'
#
# print(str_float, " 的hex 码为: ",float_to_hex(str_float) )
# print(str_hex," 的float 码为: ",hex_to_float(str_hex))
# print(str_hex," 的float 码为: ",float_convert_hex(str_hex))
# print(str(str_float) + " 的ASCII 码为: ", chr(int(str_float)))
# print(str_ascii + " 的String 码为: ", ord(str_ascii))
