require('nvim-web-devicons').setup {
  color_icons = true;
  default = true;
  strict = true;

  override_by_extension = {
  ["rb"] = {
    icon = "",
    color = "#9b2910",
    name = "Ruby"
  }
 };
}

