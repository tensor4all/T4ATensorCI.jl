using T4ATensorCI
using ITensors
using ITensorMPS
using Documenter

preamble = quote
    using T4ATensorCI
    using ITensors
    using ITensorMPS
end

DocMeta.setdocmeta!(T4ATensorCI, :DocTestSetup, preamble; recursive=true)

makedocs(;
    modules=[
        T4ATensorCI,
        Base.get_extension(T4ATensorCI, :TCIITensorConversion)
    ],
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
