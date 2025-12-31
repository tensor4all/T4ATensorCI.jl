module TCIT4AITensorCompatConversion

import T4ATensorCI as TCI
import T4ATensorTrain

using ITensors
using T4AITensorCompat

# Conversions between `T4ATensorTrain.TensorTrain` (re-exported by T4ATensorCI)
# and `T4AITensorCompat.TensorTrain` are provided by `T4ATensorTrain`'s extension
# `TTT4AITensorCompatConversion`. Do not re-define them here.

end

