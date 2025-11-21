using Test

import T4ATensorCI as TCI
using ITensors
using T4AITensorCompat

@testset "TCIT4AITensorCompatConversion.jl" begin
    @testset "TT to T4AITensorCompat.TensorTrain conversion" begin
        # MPS case
        tt = TCI.TensorTrain([rand(1, 4, 4), rand(4, 4, 2), rand(2, 4, 7), rand(7, 4, 1)])
        tt_compat = T4AITensorCompat.TensorTrain(tt)
        @test length(tt_compat) == length(tt)
        @test [dim(l) for l in T4AITensorCompat.linkinds(tt_compat)] == TCI.linkdims(tt)
        
        # Convert back
        tt_back = TCI.TensorTrain(tt_compat)
        @test length(tt_back) == length(tt)
        @test TCI.linkdims(tt_back) == TCI.linkdims(tt)
        
        # Verify values match (within numerical precision)
        for i in 1:length(tt)
            @test size(tt_back[i]) == size(tt[i])
        end
    end
    
    @testset "AbstractTensorTrain to T4AITensorCompat.TensorTrain conversion" begin
        tt = TCI.TensorTrain([rand(1, 3, 2), rand(2, 3, 1)])
        tt_compat = T4AITensorCompat.TensorTrain(tt)
        @test length(tt_compat) == length(tt)
    end
end

