import pdb


class Config(pdb.DefaultConfig):
    sticky_by_default = True
    current_line_color = 44
    use_terminal256formatter = True

    def setup(self, pdb):
        pass

    def __init__(self):
        try:
            from pygments.formatters import terminal
        except ImportError:
            pass
        else:
            self.colorscheme = terminal.TERMINAL_COLORS.copy()
            self.colorscheme.update(
                {
                    terminal.Keyword: ("darkred", "red"),
                    terminal.Number: ("darkyellow", "yellow"),
                    terminal.String: ("brown", "green"),
                    terminal.Name.Function: ("darkgreen", "blue"),
                }
            )
