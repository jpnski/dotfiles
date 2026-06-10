return {
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = ":call mkdp#util#install()",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
      config = function()
        vim.keymap.set("n", "<C-m>", vim.cmd.MarkdownPreviewToggle)
        vim.keymap.set("n", "<leader>mp", function()
          vim.cmd("w")
          local fname = vim.fn.expand("%:t:r")
          local result = vim.fn.system("pandoc " .. vim.fn.shellescape(vim.fn.expand("%")) ..
                                        " -o " .. vim.fn.shellescape(fname .. ".pdf") ..
                                        " --pdf-engine=typst -M mainfont=\"DejaVu Sans\" 2>&1")
          if vim.v.shell_error == 0 then
            vim.notify("PDF generated: " .. fname .. ".pdf", vim.log.levels.INFO)
          else
            vim.notify("PDF generation failed:\n" .. result, vim.log.levels.ERROR)
          end
        end, { desc = "Export markdown to PDF via typst" })
      end,
      lazy = false,
    }
}
