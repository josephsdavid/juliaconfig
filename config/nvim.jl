function _edit(p::T, args...; kwds...) where {T<:AbstractString}
    # slight bug with the path when running stuff this way, this fixes it for now
    edit(joinpath(pwd(), p), args...; kwds...)
end

function _edit(p, args...; kwds...)
    # use dispatch to handle editing functions and methods
    edit(p, args...; kwds...)
end

function vim(p, args...; kwds...)
    editor = get(ENV, "JULIA_EDITOR", "")
    # for some reason if i do it this way, it works, and if i do it not this way, it no works (aka doesnt work if i use bashrc)
    ENV["JULIA_EDITOR"] = "nvim --server $(ENV["HOME"])/.cache/nvim/server.pipe --remote-silent"
    _edit(p, args...; kwds...)
    # delete the ghost buffer created
    run(`nvim --server $(ENV["HOME"])/.cache/nvim/server.pipe --remote-send ':bd<CR>:bn<CR>'`)
    ENV["JULIA_EDITOR"] = editor
    return nothing
end

function tabe(p, args...; kwds...)
    editor = get(ENV, "JULIA_EDITOR", "")
    # for some reason if i do it this way, it works, and if i do it not this way, it no works (aka doesnt work if i use bashrc)
    ENV["JULIA_EDITOR"] = "nvim --server $(ENV["HOME"])/.cache/nvim/server.pipe --remote-tab-silent"
    _edit(p, args...; kwds...)
    # delete the ghost tab created
    run(`nvim --server $(ENV["HOME"])/.cache/nvim/server.pipe --remote-send ':tabclose<CR>'`)
    ENV["JULIA_EDITOR"] = editor
    return nothing
end

