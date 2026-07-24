import time
import struct
import asm_processor

class MockStrtab:
    def __init__(self, names):
        self.names = names
    def lookup_str(self, index):
        return self.names[index]

def run_benchmark():
    num_symbols = 5000
    names = [f"symbol_{i}" for i in range(num_symbols)]
    strtab = MockStrtab(names)

    fmt = asm_processor.ElfFormat(is_big_endian=True)

    # Each symbol entry is packed as: 'IIIBBH'
    # st_name, st_value, st_size, st_info, st_other, st_shndx
    symbol_data_list = []
    for i in range(num_symbols):
        # Pack symbol values
        data = fmt.pack('IIIBBH', i, i * 4, 4, 0x12, 0, 1)
        symbol_data_list.append(data)

    binary_data = b"".join(symbol_data_list)

    # Construct a Section object.
    # header is 40 bytes for Elf32_Shdr:
    # sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link, sh_info, sh_addralign, sh_entsize
    # SHT_SYMTAB = 2
    header = fmt.pack('IIIIIIIIII', 0, 2, 0, 0, 0, len(binary_data), 1, 0, 4, 16)

    sec = asm_processor.Section(fmt, header, binary_data, 2)
    sec.sh_size = len(binary_data)
    sec.sh_type = 2 # SHT_SYMTAB
    sec.sh_entsize = 16
    sec.sh_link = 1

    sections = [None, strtab, sec]

    # Measure init_symbols time
    start_init = time.perf_counter()
    sec.init_symbols(sections)
    end_init = time.perf_counter()
    init_duration = end_init - start_init

    # Measure find_symbol time (look up every symbol multiple times to amplify difference)
    lookups = names + [f"nonexistent_{i}" for i in range(100)]
    iterations = 5

    start_lookup = time.perf_counter()
    for _ in range(iterations):
        for name in lookups:
            sec.find_symbol(name)
    end_lookup = time.perf_counter()
    lookup_duration = end_lookup - start_lookup

    print(f"Init duration: {init_duration:.6f} seconds")
    print(f"Lookup duration ({iterations} iterations of {len(lookups)} lookups): {lookup_duration:.6f} seconds")
    print(f"Total: {init_duration + lookup_duration:.6f} seconds")

if __name__ == "__main__":
    run_benchmark()
