return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local section = opts.sections and opts.sections.lualine_c
      if not section then
        return
      end

      local function component_name(component)
        if type(component) == "string" then
          return component
        end
        if type(component) == "table" then
          return component[1]
        end
      end

      local filtered = {}
      for _, component in ipairs(section) do
        if component_name(component) ~= "filetype" then
          filtered[#filtered + 1] = component
        end
      end

      table.insert(
        filtered,
        1,
        { "filetype", icon_only = false, separator = "  ", padding = { left = 1, right = 0 } }
      )

      opts.sections.lualine_c = filtered
    end,
  },
}
