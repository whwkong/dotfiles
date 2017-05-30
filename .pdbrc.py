import pdb

# specifically for pdbpp
class Config(pdb.DefaultConfig):
    sticky_by_default = True

    def setup(self, pdb):
        from pprint import pprint
        import json
