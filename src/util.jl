function string_to_uint(s::String)
    len = length(s)
    if isodd(len)
        error("Input string length should have be even")
    end
    arr = Array(Uint8, div(len,2))
    i = j = 0
    while i < len
        n = 0
        c = s[i+=1]
        n = '0' <= c <= '9' ? c - '0' :
            'a' <= c <= 'f' ? c - 'a' + 10 :
            'A' <= c <= 'F' ? c - 'A' + 10 : error("Input string isn't a hexadecimal string")
        c = s[i+=1]
        n = '0' <= c <= '9' ? n << 4 + c - '0' :
            'a' <= c <= 'f' ? n << 4 + c - 'a' + 10 :
            'A' <= c <= 'F' ? n << 4 + c - 'A' + 10 : error("Input string isn't a hexadecimal string")
        arr[j+=1] = uint8(n)
    end
    return arr
end
