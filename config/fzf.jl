####
#### fzf actions
####
function fzf_hist_search(mistate, o, c)
        line = JLFzf.inter_fzf(JLFzf.read_repl_hist(), "--read0", "--tiebreak=index", "--height=80%")
        JLFzf.insert_history_to_repl(mistate, line)
end

# TODO: "TAB" COMPLETION - bind to c-n or something
# TODO: pkg actions
# TODO: run _test function (which activates testenv, perhaps in a new repl)
# TODO: add testenv into the thing



