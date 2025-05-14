-- Preview Markdown in the browser
return { "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]() -- install without yarn or npm
    end,
    keys = {
      {"<Leader>mp", ":MarkdownPreviewToggle<CR>", mode = "n", desc = "Toggle Markdown Preview"}
    }
}
