require("nvim-dap-virtual-text").setup{
    display_callback = function(variable, buf, stackframe, node, options)
        local var_type
        if variable.type then
          var_type = ' (' .. variable.type .. ')'
        else
          var_type = ""
        end
        if options.virt_text_pos == 'inline' then
          return var_type .. ' = ' .. variable.value
        else
          return variable.name .. var_type .. ' = ' ..  variable.value
        end
      end,
}