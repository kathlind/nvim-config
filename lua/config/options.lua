-- =========================
-- UI
-- =========================

vim.opt.number = true -- показывать абсолютные номера строк
vim.opt.relativenumber = true -- показывать относительные номера строк
vim.opt.termguicolors = true -- включить true color support для нормальных цветов темы
vim.opt.cursorline = true -- подсвечивать текущую строку
vim.opt.signcolumn = "yes" -- всегда держать 1 колонку под diagnostics/git signs, чтобы текст не прыгал
vim.opt.foldcolumn = "1" -- держать 1 колонку под folds; statuscol сможет красиво её использовать
vim.opt.wrap = false -- не переносить длинные строки
vim.opt.linebreak = true -- если wrap включён, переносить строки по словам, а не посреди слова
vim.opt.showmode = false -- не показывать режим INSERT/NORMAL, потому что это обычно делает statusline
vim.opt.ruler = false -- отключить стандартный ruler внизу
vim.opt.laststatus = 0 -- не показывать statusline снизу
vim.opt.statusline = " " -- убрать текст из statusline-разделителя между горизонтальными split-окнами

-- Символы разделителей между окнами.
-- vert отвечает за вертикальный разделитель.
-- stl/stlnc отвечают за строку-разделитель между горизонтальными split-окнами.
vim.opt.fillchars = {
	vert = "│",
	horiz = "─",
	horizup = "┴",
	horizdown = "┬",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
	stl = "─",
	stlnc = "─",
	eob = " ",
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = "│",
}

local function split_separators()
	local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
	local nontext = vim.api.nvim_get_hl(0, { name = "NonText", link = false })

	local fg = comment.fg and string.format("#%06x", comment.fg) or "#888888"
	local fg_nc = nontext.fg and string.format("#%06x", nontext.fg) or "#555555"

	vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg, bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = fg, bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = fg_nc, bg = "NONE" })
end

split_separators()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = split_separators,
})

vim.opt.scrolloff = 18 -- держать 18 строк сверху/снизу вокруг курсора
vim.opt.sidescrolloff = 8 -- держать 8 колонок слева/справа вокруг курсора
vim.opt.mouse = "a" -- включить мышь
vim.opt.pumheight = 10 -- максимум 10 элементов в completion popup
vim.opt.pumblend = 10 -- лёгкая прозрачность popup menu
vim.opt.winminwidth = 5 -- минимальная ширина окна
vim.opt.smoothscroll = true -- более плавный скролл
vim.opt.splitbelow = true -- горизонтальный split открывается снизу
vim.opt.splitright = true -- вертикальный split открывается справа
vim.opt.splitkeep = "screen" -- меньше скачков экрана при открытии split

-- =========================
-- Indentation
-- =========================

vim.opt.expandtab = true -- превращать tab в пробелы
vim.opt.tabstop = 4 -- визуальная ширина tab
vim.opt.shiftwidth = 4 -- размер отступа для >>, << и автоотступов
vim.opt.softtabstop = 4 -- сколько пробелов вставляет Tab в insert mode
vim.opt.shiftround = true -- округлять отступы до кратного shiftwidth
vim.opt.smartindent = true -- автоматически добавлять умный отступ на новой строке

-- =========================
-- Search
-- =========================

vim.opt.ignorecase = true -- поиск без учёта регистра
vim.opt.smartcase = true -- если в поиске есть заглавная буква, искать с учётом регистра
vim.opt.incsearch = true -- показывать совпадения прямо во время ввода поиска
vim.opt.hlsearch = true -- подсвечивать найденные совпадения
vim.opt.inccommand = "nosplit" -- preview для :substitute прямо в текущем окне

-- =========================
-- Clipboard
-- =========================

vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
-- unnamedplus синхронизирует yank/paste с системным буфером
-- при SSH отключаем, чтобы не ловить проблемы с clipboard

-- =========================
-- Completion
-- =========================

vim.opt.completeopt = "menu,menuone,noselect"
-- menu: показывать completion menu
-- menuone: показывать меню даже если вариант один
-- noselect: не выбирать первый элемент автоматически

-- =========================
-- Formatting / text behavior
-- =========================

vim.opt.formatoptions = "jcroqlnt"
-- j: удалять comment leader при join
-- c/r/o: поведение автокомментариев
-- q: разрешить gq formatting
-- l/n/t: поведение форматирования текста

vim.g.markdown_recommended_style = 0 -- не давать Vim перетирать твои настройки отступов в markdown

-- =========================
-- Folds
-- =========================

vim.opt.foldlevel = 99 -- по умолчанию почти все folds открыты
vim.opt.foldmethod = "manual" -- folds строятся по отступам
vim.opt.foldexpr = ""

vim.opt.foldtext = "" -- не использовать дефолтный текст fold

-- =========================
-- Sessions
-- =========================

vim.opt.sessionoptions = {
	"buffers", -- сохранять буферы
	"curdir", -- сохранять текущую директорию
	"tabpages", -- сохранять tab pages
	"winsize", -- сохранять размеры окон
	"help", -- сохранять help windows
	"globals", -- сохранять глобальные переменные с заглавной буквы
	"skiprtp", -- не сохранять runtimepath
	"folds", -- сохранять folds
}

-- =========================
-- Undo
-- =========================

vim.opt.undofile = true -- сохранять undo history между перезапусками Neovim
vim.opt.undolevels = 1000 -- сколько уровней undo

-- =========================
-- Save / modified buffers
-- =========================

vim.opt.confirm = true -- спрашивать, что делать с несохранёнными изменениями при выходе
vim.opt.autowrite = true -- автоматически сохранять перед некоторыми командами типа :next, :make

-- =========================
-- Grep
-- =========================

vim.opt.grepprg = "rg --vimgrep" -- использовать ripgrep для :grep
vim.opt.grepformat = "%f:%l:%c:%m" -- формат вывода rg для quickfix

-- =========================
-- Timing
-- =========================

vim.opt.timeoutlen = 300 -- быстрее срабатывает which-key и leader-комбинации
vim.opt.updatetime = 200 -- быстрее diagnostics, CursorHold и некоторые плагины

-- =========================
-- Command-line
-- =========================

vim.opt.wildmode = "longest:full,full" -- удобное completion-поведение в command-line
vim.opt.jumpoptions = "view" -- лучше сохраняет положение экрана при прыжках

-- =========================
-- Messages
-- =========================

vim.opt.shortmess:append({
	W = true, -- меньше сообщений при записи файла
	I = true, -- убрать intro message
	c = true, -- меньше completion-сообщений
	C = true, -- меньше сообщений при scanning completion
})

-- =========================
-- Spell
-- =========================

vim.opt.spelllang = { "en" } -- язык spellcheck, сам spell при этом не включает

-- =========================
-- Visual block
-- =========================

vim.opt.virtualedit = "block" -- в visual block можно ставить курсор туда, где нет символов

-- =========================
-- Messages / command display
-- =========================

vim.opt.showcmdloc = "tabline" -- выводить showcmd в верхнюю lualine/tabline
