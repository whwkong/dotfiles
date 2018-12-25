import pdb


class Config(pdb.DefaultConfig):
    sticky_by_default = True
    current_line_color = 44

    def setup(self, pdb):
        pass
