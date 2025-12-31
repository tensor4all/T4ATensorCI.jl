module T4ATensorCI

using LinearAlgebra
using EllipsisNotation
using BitIntegers
import QuadGK

# Import from new packages
import T4AMatrixCI
import T4ATensorTrain

# To add a method for rank(tci)
import LinearAlgebra: rank, diag
import LinearAlgebra as LA
# To define equality of IndexSet, and TT addition
import Base: ==, +
# To define iterators and element access for MCI, TCI and TT objects
import Base: isempty, iterate, getindex, lastindex, broadcastable
import Base: length, size, sum
import Random

# Import from T4AMatrixCI - use import for types that may be extended
import T4AMatrixCI
import T4AMatrixCI: rrlu, rrlu!, arrlu, rrLU, MatrixCI, MatrixLUCI, MatrixACA
import T4AMatrixCI: left, right, npivots, rowindices, colindices, pivoterrors, lastpivoterror
# MatrixCI helpers used throughout TCI code (kept for backwards compatibility)
import T4AMatrixCI: AtimesBinv, AinvtimesB
import T4AMatrixCI: submatrix, localerror, findnewpivot
import T4AMatrixCI: addpivotrow!, addpivotcol!, addpivot!
import T4AMatrixCI: setcols!, setrows!
import T4AMatrixCI: pivotmatrix, leftmatrix, rightmatrix
import T4AMatrixCI: nrows, ncols, availablerows, availablecols
import T4AMatrixCI: row, col
import T4AMatrixCI: submatrixargmax
import T4AMatrixCI: colmatrix, rowmatrix, colstimespivotinv, pivotinvtimesrows
# Re-export for backwards compatibility
export rrlu, rrlu!, arrlu, rrLU, MatrixCI, MatrixLUCI, MatrixACA
export left, right, npivots, rowindices, colindices, pivoterrors, lastpivoterror
export AtimesBinv, AinvtimesB
export submatrix, localerror, findnewpivot
export addpivotrow!, addpivotcol!, addpivot!
export setcols!, setrows!
export pivotmatrix, leftmatrix, rightmatrix
export nrows, ncols, availablerows, availablecols
export row, col
export crossinterpolate
export submatrixargmax
export colmatrix, rowmatrix, colstimespivotinv, pivotinvtimesrows
export submatrixargmax

# Import from T4ATensorTrain - use import for functions that will be extended
import T4ATensorTrain
import T4ATensorTrain: AbstractTensorTrain, TensorTrain, TTCache, BatchEvaluator
import T4ATensorTrain: TensorTrainFit
import T4ATensorTrain: tensortrain, sitedims, sitedim, linkdims, linkdim
import T4ATensorTrain: sitetensors, sitetensor, fulltensor, compress!
import T4ATensorTrain: add, subtract, contract_naive, contract_zipup
import T4ATensorTrain: Algorithm, @Algorithm_str
import T4ATensorTrain: LocalIndex, MultiIndex, _contract, _contractsitetensors
import T4ATensorTrain: isbatchevaluable
import T4ATensorTrain: batchevaluate
import T4ATensorTrain: flatten, to_tensors
# Re-export for backwards compatibility
export AbstractTensorTrain, TensorTrain, TTCache, BatchEvaluator
export TensorTrainFit
export tensortrain, evaluate, sitedims, sitedim, linkdims, linkdim, rank
export sitetensors, sitetensor, fulltensor, compress!
export add, subtract, contract, contract_naive, contract_zipup
export Algorithm, @Algorithm_str
export isbatchevaluable
export batchevaluate
export flatten, to_tensors

export crossinterpolate1, crossinterpolate2, optfirstpivot

# -----------------------------------------------------------------------------
# Backwards-compatible `evaluate` entry point
#
# Historically, T4ATensorCI owned `evaluate` as a generic and had methods for TT,
# matrix CI objects, and TCI objects. After extraction, we keep a local `evaluate`
# and forward to the appropriate package to avoid type piracy.
# -----------------------------------------------------------------------------

evaluate(args...; kwargs...) = T4ATensorTrain.evaluate(args...; kwargs...)
evaluate(ci::T4AMatrixCI.MatrixCI, args...; kwargs...) = T4AMatrixCI.evaluate(ci, args...; kwargs...)
evaluate(ci::T4AMatrixCI.MatrixACA, args...; kwargs...) = T4AMatrixCI.evaluate(ci, args...; kwargs...)
export evaluate

# -----------------------------------------------------------------------------
# Backwards-compatible `crossinterpolate` entry point
#
# `T4ATensorCI` historically provided both:
# - `crossinterpolate(::AbstractMatrix)` -> matrix cross interpolation (now in T4AMatrixCI)
# - `crossinterpolate(::Type{ValueType}, f, localdims, ...)` -> TensorCI1 constructor (still here)
#
# We keep `crossinterpolate` owned by T4ATensorCI and forward the matrix method.
# -----------------------------------------------------------------------------

crossinterpolate(a::AbstractMatrix; kwargs...) = T4AMatrixCI.crossinterpolate(a; kwargs...)

include("util.jl")
include("sweepstrategies.jl")
include("indexset.jl")
include("batcheval.jl")
include("cachedfunction.jl")
include("tensorci1.jl")
include("globalpivotfinder.jl")
include("tensorci2.jl")
include("conversion.jl")
include("integration.jl")
include("contraction.jl")
include("globalsearch.jl")

end
