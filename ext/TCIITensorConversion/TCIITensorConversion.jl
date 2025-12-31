module TCIITensorConversion

import T4ATensorCI as TCI
import T4ATensorCI: evaluate
import T4ATensorTrain

using ITensors
import ITensorMPS
import ITensorMPS: MPS, MPO

export MPS, MPO
export evaluate

# Conversions between `T4ATensorTrain.TensorTrain` (re-exported by T4ATensorCI)
# and ITensorMPS types are provided by `T4ATensorTrain`'s extension
# `TTITensorConversion`. Do not re-define them here to avoid method overwriting
# during precompilation.
include("mpsutil.jl")

end
