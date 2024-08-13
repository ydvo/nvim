return{
  default_config = {
    cmd = {"hdl_checker", "--lsp", };
    filetypes = {"vhdl", "verilog", "systemverilog"};
    root_dir = function(fname)
      -- will look for the .hdl_checker.config file in parent directory, a
      -- .git directory, or else use the current directory, in that order.
      local util = require'lspconfig'.util
      return util.root_pattern('.hdl_checker.config')(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end;
    settings = {};
  };
}
