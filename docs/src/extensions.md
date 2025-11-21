# Extensions

This page documents extensions to [T4ATensorCI](https://github.com/tensor4all/T4ATensorCI.jl).

There are two independent extensions: `TCIITensorConversion` and `TCIT4AITensorCompatConversion`.

## TCIITensorConversion

Dependencies:
- [ITensors.jl](https://github.com/ITensor/ITensors.jl)
- [ITensorMPS.jl](https://github.com/ITensor/ITensorMPS.jl)

This module is automatically loaded when ITensors and ITensorMPS are present in addition to T4ATensorCI. It offers conversion constructors between ITensorMPS types (MPS/MPO) and T4ATensorCI types, and an analogue of the `evaluate` function for ITensor types.

```@autodocs
Modules = [let ext = Base.get_extension(T4ATensorCI, :TCIITensorConversion); ext === nothing ? Module[] : [ext]; end...]
```

## TCIT4AITensorCompatConversion

Dependencies:
- [ITensors.jl](https://github.com/ITensor/ITensors.jl)
- [T4AITensorCompat.jl](https://github.com/tensor4all/T4AITensorCompat.jl)

This module is automatically loaded when ITensors and T4AITensorCompat are present in addition to T4ATensorCI. It offers conversion constructors between T4AITensorCompat.TensorTrain and T4ATensorCI.TensorTrain.

```@autodocs
Modules = [let ext = Base.get_extension(T4ATensorCI, :TCIT4AITensorCompatConversion); ext === nothing ? Module[] : [ext]; end...]
```
