using Aqua
import T4ATensorCI as TCI

@testset "Aqua" begin
    Aqua.test_all(TCI; ambiguities = false, unbound_args = false, deps_compat = false)
end
