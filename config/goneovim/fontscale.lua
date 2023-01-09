
vim.keymap.set("n", "<D-=>", [[:lua guifontscale(1)<CR>]], { noremap = true })
vim.keymap.set("n", "<D-->", [[:lua guifontscale(-1)<CR>]], { noremap = true })
function guifontscale(n)
    if type(n) ~= "number" then
        return
    end

    local gfa = {}
    for c in vim.gsplit(vim.o.guifont, ":") do
        table.insert(gfa, c)
    end
    local buildnewgf = ""
    for k, v in ipairs(gfa) do
        if v:find("h", 1, true) == 1 then
            fweight = ""
            for w in vim.gsplit(v, "h") do
                if tonumber(w) == nil then
                    goto continue
                end
                wn = tonumber(w)
                wn = wn + n
                fweight = fweight .. tostring(wn)
                ::continue::
            end

            buildnewgf = buildnewgf .. "h" .. fweight .. ":"
        else
            v = string.gsub(v, " ", "_")
            buildnewgf = buildnewgf ..  v .. ":"

        end
    end

    local setcmd = "set guifont=" .. buildnewgf
    vim.cmd(setcmd)
end
