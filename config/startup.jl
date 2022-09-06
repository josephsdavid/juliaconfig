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

# TODO: Hook which runs tests, and then goes into failed tests, activates test environment, and then enters you into a debugger repl (I think i can just use debugger.jl to do something like this)

function customize_keys(repl)
    repl.interface = REPL.setup_interface(repl; extra_repl_keymap = keybinds)
end
atreplinit(customize_keys)
