function sha256(str::String)
    z = Array(Uint8, 32)
    if ccall( (:crypto_hash_sha256_ref, "libsodium"), Int32, (Ptr{Uint8}, Ptr{Uint8}, Uint64), z, str, length(str)) != 0
        error("Error!")
    end
    return z
end

function sha512(str::String)
    z = Array(Uint8, 64)
    if ccall( (:crypto_hash_sha512_ref, "libsodium"), Int32, (Ptr{Uint8}, Ptr{Uint8}, Uint64), z, str, length(str)) != 0
        error("Error!")
    end
    return z
end
