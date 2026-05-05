return {
	"folke/snacks.nvim",
	priority = 1000, -- грузится одним из первых, потому что Snacks даёт базовые UI/QoL-модули
	lazy = false,

	opts = {
		-- Плавный скролл.
		scroll = {
			enabled = true,
		},

		-- Отображение отступов и анимированный scope.
		indent = {
			enabled = true,
			animate = {
				enabled = true,
			},
		},

		input = {
			enabled = true,
		},

		-- Уведомления в углу экрана.
		notifier = {
			enabled = true,
			timeout = 3000,
			style = "fancy",
		},

		-- Умный scope для работы с блоками кода.
		scope = {
			enabled = true,
		},

		-- Встроенная интеграция Snacks с lazygit.
		lazygit = {
			enabled = true,
		},

		-- Подсветка слова под курсором и переходы по совпадениям.
		words = {
			enabled = true,
		},
		dashboard = { enabled = false },
		statuscolumn = { enabled = false },
		bigfile = { enabled = false },
	},
}
