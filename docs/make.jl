using DimRedux
using Documenter

DocMeta.setdocmeta!(DimRedux, :DocTestSetup, :(using DimRedux); recursive=true)

makedocs(;
    modules=[DimRedux],
    authors="Evan Ewing",
    repo="https://github.com/eewing1/DimRedux.jl/blob/{commit}{path}#{line}",
    sitename="DimRedux.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://eewing1.github.io/DimRedux.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/eewing1/DimRedux.jl",
    devbranch="master",
)
