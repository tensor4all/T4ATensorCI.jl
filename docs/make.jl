using T4ATensorCI
using ITensors
using ITensorMPS
using Documenter

# Try to load T4AITensorCompat if available
try
    using T4AITensorCompat
catch
    # T4AITensorCompat not available, extension won't be loaded
end

preamble = quote
    using T4ATensorCI
    using ITensors
    using ITensorMPS
    try
        using T4AITensorCompat
    catch
    end
end

DocMeta.setdocmeta!(T4ATensorCI, :DocTestSetup, preamble; recursive=true)

# Get extensions if they are loaded
extensions = Module[]
tci_itensor_ext = Base.get_extension(T4ATensorCI, :TCIITensorConversion)
if tci_itensor_ext !== nothing
    push!(extensions, tci_itensor_ext)
end
tci_t4a_compat_ext = Base.get_extension(T4ATensorCI, :TCIT4AITensorCompatConversion)
if tci_t4a_compat_ext !== nothing
    push!(extensions, tci_t4a_compat_ext)
end

makedocs(;
    modules=vcat([T4ATensorCI], extensions),
    authors="Ritter.Marc <Ritter.Marc@physik.uni-muenchen.de> and contributors",
    sitename="T4ATensorCI.jl",
    format=Documenter.HTML(;
        canonical="https://github.com/tensor4all/T4ATensorCI.jl",
        edit_link="main",
        assets=String[]),
    pages=[
        "Home" => "index.md",
        "Documentation" => "documentation.md",
        "Extensions" => "extensions.md",
    ]
)

deploydocs(;
    repo="github.com/tensor4all/T4ATensorCI.jl.git",
    devbranch="main",
)
