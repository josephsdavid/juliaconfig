using Revise
using TestEnv
import JLFzf
import REPL
import REPL.LineEdit

include("fzf.jl")
include("nvim.jl")


const keybinds = Dict{Any,Any}(
    "^r" => fzf_hist_search,
)

function customize_keys(repl)
    repl.interface = REPL.setup_interface(repl; extra_repl_keymap = keybinds)
end
atreplinit(customize_keys)
