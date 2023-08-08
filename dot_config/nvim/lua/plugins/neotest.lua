return {
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-go" },
  { "nvim-neotest/neotest-jest" },
  { "rouge8/neotest-rust" },
  { "marilari88/neotest-vitest" },

  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-plenary"] = {
          min_init = "./tests/init.lua",
        },
        ["neotest-vitest"] = {},
        ["neotest-jest"] = {},
        ["neotest-rust"] = {},
        ["neotest-go"] = {},
      },
    },
  },
}
