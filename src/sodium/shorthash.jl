function siphash(key::String, str::String)
    key = string_to_uint(key)
    z = Array(Uint8, 8)
    if ccall( (:crypto_shorthash_siphash24_ref, "libsodium"), Int32, 
        (Ptr{Uint8}, Ptr{Uint8}, Uint64, Ptr{Uint8}), 
        z, str, length(str), key) != 0
        error("Error!")
    end
    return z
end
