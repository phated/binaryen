import subprocess
from scripts.test import shared
from . import utils


class InitialFuzzTest(utils.BinaryenTestCase):
    def test_empty_initial(self):
        # generate fuzz from random data
        data = self.input_path('random_data.txt')
        a = shared.run_process(shared.WASM_OPT + ['-ttf', '--print', data],
                               stdout=subprocess.PIPE)

        # generate fuzz from random data with initial empty wasm
        empty_wasm = self.input_path('empty.wasm')
        b = shared.run_process(
            shared.WASM_OPT + ['-ttf', '--print', data,
                               '--initial-fuzz=' + empty_wasm],
                               stdout=subprocess.PIPE)

        self.assertEqual(a, b)
