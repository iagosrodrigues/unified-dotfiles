-- local present, cmp = pcall(require, "cmp")
--
-- if not present then
--   return
-- end
--
-- local status_luasnip, luasnip = pcall(require, "luasnip")
-- if not status_luasnip then
--   return
-- end
--
-- local autopairs_present, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
--
-- if autopairs_present then
--   cmp.event:on("confirm_done", autopairs.on_confirm_done())
-- end
--
-- local lspkind = require "lspkind"
-- local compare = require "cmp.config.compare"
--
-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end
--
-- local cmp_select = { behavior = cmp.ConfirmBehavior.Replace, select = false }
--
-- local function border(hl_name)
--   return {
--     { "╭", hl_name },
--     { "─", hl_name },
--     { "╮", hl_name },
--     { "│", hl_name },
--     { "╯", hl_name },
--     { "─", hl_name },
--     { "╰", hl_name },
--     { "│", hl_name },
--   }
-- end
--
-- cmp.setup {
--   preselect = cmp.PreselectMode.None,
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   sources = cmp.config.sources {
--     -- { name = "copilot",  group_index = 2 },
--     { name = "nvim_lsp", group_index = 2 },
--     { name = "buffer",   group_index = 2 },
--     { name = "luasnip",  group_index = 2 },
--     { name = "path",     group_index = 2 },
--   },
--   mapping = cmp.mapping.preset.insert {
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
--     -- ["<Tab>"] = cmp.mapping(function(fallback)
--     ["<Tab>"] = vim.schedule_wrap(function(fallback)
--       if cmp.visible() and has_words_before() then
--         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--       elseif luasnip.jumpable(1) then
--         luasnip.jump(1)
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       elseif luasnip.expandable() then
--         luasnip.expand()
--         --[[ elseif has_words_before() then
--         cmp.complete() ]]
--       else
--         fallback()
--       end
--     end),
--     -- end, { "i", "s" }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--     ["<C-e>"] = cmp.mapping.close(),
--   },
--   formatting = {
--     fields = { "kind", "abbr", "menu" },
--     format = lspkind.cmp_format { with_text = false, maxwidth = 50 },
--   },
--   sorting = {
--     priority_weight = 2,
--     comparators = {
--       compare.offset,
--       compare.exact,
--       compare.score,
--       compare.recently_used,
--       compare.locality,
--       compare.sort_text,
--       compare.length,
--       compare.order,
--     },
--   },
--   confirm_opts = {
--     behavior = cmp.ConfirmBehavior.Replace,
--     select = false,
--   },
--   window = {
--     documentation = {
--       border = border "CmpDocBorder",
--     },
--     completion = {
--       -- border = "rounded",
--       border = border "CmpBorder",
--       -- winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
--       winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
--     },
--   },
--   experimental = {
--     ghost_text = true,
--   },
-- }
