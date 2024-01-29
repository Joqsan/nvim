require("nvim-dap-virtual-text").setup{
    display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
          return ' (' .. variable.type .. ')' .. ' = ' .. variable.value
        else
          return variable.name .. ' (' .. variable.type .. ')' .. ' = ' ..  variable.value
        end
      end,
}