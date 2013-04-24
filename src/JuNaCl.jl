module JuNaCl
    include("util.jl")
    include("types.jl")

    include("sodium/hash.jl")
    export sha256, sha512

    include("sodium/shorthash.jl")
    export siphash

    include("sodium/auth.jl")
    export auth, verify,
           auth_hmacsha256, auth_hmacsha512256,
           verify_hmacsha256, verify_hmacsha512256
end
