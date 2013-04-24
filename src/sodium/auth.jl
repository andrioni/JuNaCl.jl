function auth_hmacsha512256(key::Vector{Uint8}, str::String)
    if length(key) != 32
        error("Key should have 64-bit")
    end
	z = Array(Uint8, 32)
	if ccall( (:crypto_auth_hmacsha512256_ref, "libsodium"), Int32, 
		(Ptr{Uint8}, Ptr{Uint8}, Uint64, Ptr{Uint8}), 
		z, str, length(str), key) != 0
		error("Error!")
	end
	return z
end
auth(key::Vector{Uint8}, str::String) = auth_hmacsha512256(key, str)

function auth_hmacsha256(key::Vector{Uint8}, str::String)
    #if length(key) != 32
    #    error("Key should have 64-bit")
    #end
    z = Array(Uint8, 32)
    if ccall( (:crypto_auth_hmacsha256_ref, "libsodium"), Int32, 
        (Ptr{Uint8}, Ptr{Uint8}, Uint64, Ptr{Uint8}), 
        z, str, length(str), key) != 0
        error("Error!")
    end
    return z
end

function verify_hmacsha512256(key::Vector{Uint8}, str::String, hsh)
    if length(key) != 32
        error("Key should have 64-bit")
    end
	return 0 == ccall( (:crypto_auth_hmacsha512256_ref_verify, "libsodium"), Int32, 
		(Ptr{Uint8}, Ptr{Uint8}, Uint64, Ptr{Uint8}), 
		hsh, str, length(str), key)
end
verify(key::Vector{Uint8}, str::String, hsh) = verify_hmacsha512256(key, str, hsh)

function verify_hmacsha256(key::Vector{Uint8}, str::String, hsh)
    #if length(key) != 32
    #    error("Key should have 64-bit")
    #end
    return 0 == ccall( (:crypto_auth_hmacsha256_ref_verify, "libsodium"), Int32, 
        (Ptr{Uint8}, Ptr{Uint8}, Uint64, Ptr{Uint8}), 
        hsh, str, length(str), key)
end
