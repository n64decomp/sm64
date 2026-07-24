import sys
import importlib.util

# Shim for 'imp' module which is missing in Python 3.12+ but required by old 'ansiwrap'
class MockImp:
    @staticmethod
    def find_module(name, path=None):
        return (None, name, None)

    @staticmethod
    def load_module(name, file, filename, description):
        spec = importlib.util.find_spec(filename)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module

sys.modules['imp'] = MockImp

# Mock diff_settings to bypass objdump missing check and mock sys.argv
import diff_settings
original_apply = diff_settings.apply

def mocked_apply(config, args):
    original_apply(config, args)
    config['objdump_executable'] = 'objdump'

diff_settings.apply = mocked_apply

# Mock sys.argv so diff.py parses arguments successfully during import
sys.argv = ['diff.py', 'dummy_symbol']
