local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.env.HOME .. "/jdtls-workspace/" .. project_name

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local bundles = {
	vim.fn.glob(
		vim.env.HOME .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"
	),
}

vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n")
)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. vim.env.HOME .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-jar",
		vim.env.HOME .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		vim.env.HOME .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
	settings = {
		java = {
			home = vim.env.HOME .. ".local/jdk-21.0.3+9",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				-- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
				-- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
				runtimes = {
					{
						name = "JavaSE-21",
						path = vim.env.HOME .. "/.local/jdk-21.0.3+9",
					},
					{
						name = "JavaSE-17",
						path = vim.env.HOME .. "/.local/jdk-17.0.11+9",
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				-- Formatting works by default, but you can refer to a specific file/URL if you choose
				-- settings = {
				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
				--   profile = "GoogleStyle",
				-- },
			},
		},
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
			importOrder = {
				"java",
				"javax",
				"com",
				"org",
			},
		},
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
		init_options = {
			bundles = bundles,
			extendedClientCapabilities = jdtls.extendedClientCapabilities,
		},
		capabilities = capabilities,
	},
	on_attach = function(client, bufnr)
		local map = vim.keymap.set
		map("n", "<leader>oi", jdtls.organize_imports, { desc = "Jdtls [O]rganize [I]mports" })
	end,
}

jdtls.start_or_attach(config)

-- -- Needed for debugging
-- config["on_attach"] = function(client, bufnr)
-- 	jdtls.setup_dap({ hotcodereplace = "auto" })
-- 	require("jdtls.dap").setup_dap_main_class_configs()
-- end
--
