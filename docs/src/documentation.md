# Documentation

Documentation of all types and methods in module [T4ATensorCI](https://github.com/tensor4all/T4ATensorCI.jl).

## Matrix approximation


### Matrix cross interpolation (MCI)
```@autodocs
Modules = [T4ATensorCI]
Pages = ["matrixci.jl"]
```

### Adaptive cross approximation (ACA)
```@autodocs
Modules = [T4ATensorCI]
Pages = ["matrixaca.jl"]
```

### Rank-revealing LU decomposition (rrLU)
```@autodocs
Modules = [T4ATensorCI]
Pages = ["matrixlu.jl", "matrixluci.jl"]
```

## Tensor trains and tensor cross Interpolation

### Tensor train (TT)
```@autodocs
Modules = [T4ATensorCI]
Pages = ["abstracttensortrain.jl", "tensortrain.jl", "contraction.jl"]
```

### Tensor cross interpolation (TCI)
Note: In most cases, it is advantageous to use [`T4ATensorCI.TensorCI2`](@ref) instead.
```@autodocs
Modules = [T4ATensorCI]
Pages = ["tensorci1.jl", "indexset.jl", "sweepstrategies.jl"]
```

### Tensor cross interpolation 2 (TCI2)
```@autodocs
Modules = [T4ATensorCI]
Pages = ["tensorci2.jl", "globalpivotfinder.jl"]
```

### Integration
```@autodocs
Modules = [T4ATensorCI]
Pages = ["integration.jl"]
```

## Helpers and utility methods
```@autodocs
Modules = [T4ATensorCI]
Pages = ["cachedfunction.jl", "batcheval.jl", "util.jl", "globalsearch.jl"]
```

