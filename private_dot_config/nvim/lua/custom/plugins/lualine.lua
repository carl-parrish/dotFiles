return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', opts = {} },
  },
  config = function()
    local function get_word_count()
      if vim.bo.filetype == 'md' or vim.bo.filetype == 'markdown' then
        local icon = '\u{e6a5}'
        local words = vim.fn.wordcount().words
        return string.format('%s %s', words, icon)
      end
      return ''
    end

    require('lualine').setup {
      sections = {
        lualine_x = {
          { get_word_count },
          'filetype',
        },
      },
    }
  end,
}
