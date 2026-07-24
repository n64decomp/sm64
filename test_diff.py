import pytest
import sys
from unittest.mock import MagicMock

# Mock problematic dependencies before importing diff
sys.modules['ansiwrap'] = MagicMock()
sys.modules['watchdog'] = MagicMock()
sys.modules['colorama'] = MagicMock()
sys.modules['Levenshtein'] = MagicMock()
sys.modules['cxxfilt'] = MagicMock()

# Mock sys.argv to supply a dummy positional argument for diff.py's argument parser
sys.argv = ["diff.py", "dummy_start_symbol"]

from diff import parse_relocated_line, pad_mnemonic

def test_parse_relocated_line_standard_comma_parenthesis():
    # Standard assembly instruction: sw gp,16(sp)
    line = "  44:   afbc0010        sw      gp,16(sp)"
    before, imm, after = parse_relocated_line(line)
    assert before == "  44:   afbc0010        sw      gp,"
    assert imm == "16"
    assert after == "(sp)"

def test_parse_relocated_line_comma_immediate_no_parenthesis():
    # Assembly instruction with immediate and no parenthesis: addiu sp,sp,-32
    line = "  40:   27bdffd0        addiu   sp,sp,-32"
    before, imm, after = parse_relocated_line(line)
    assert before == "  40:   27bdffd0        addiu   sp,sp,"
    assert imm == "-32"
    assert after == ""

def test_parse_relocated_line_no_comma_tab_symbol():
    # Assembly instruction with tab and no comma: jalr\tt9
    line = "  50:   0320f809        jalr\tt9"
    before, imm, after = parse_relocated_line(line)
    assert before == "  50:   0320f809        jalr\t"
    assert imm == "t9"
    assert after == ""

def test_parse_relocated_line_zero_hex_conversion():
    # 0x0 immediate is normalized to 0
    line = "  44:   afbc0010        sw      gp,0x0(sp)"
    before, imm, after = parse_relocated_line(line)
    assert before == "  44:   afbc0010        sw      gp,"
    assert imm == "0"
    assert after == "(sp)"

def test_parse_relocated_line_hex_nonzero_immediate():
    # Other hex immediates should remain unchanged
    line = "  44:   afbc0010        sw      gp,0x10(sp)"
    before, imm, after = parse_relocated_line(line)
    assert before == "  44:   afbc0010        sw      gp,"
    assert imm == "0x10"
    assert after == "(sp)"

def test_parse_relocated_line_multiple_commas():
    # Split should happen on the last comma
    line = "foo,bar,baz(qux)"
    before, imm, after = parse_relocated_line(line)
    assert before == "foo,bar,"
    assert imm == "baz"
    assert after == "(qux)"

def test_parse_relocated_line_multiple_tabs_no_comma():
    # Split should happen on the last tab
    line = "foo\tbar\tbaz(qux)"
    before, imm, after = parse_relocated_line(line)
    assert before == "foo\tbar\t"
    assert imm == "baz"
    assert after == "(qux)"

def test_parse_relocated_line_no_comma_no_tab_raises_value_error():
    # If there are no commas or tabs, a ValueError should be raised
    line = "nocommaortab"
    with pytest.raises(ValueError):
        parse_relocated_line(line)

def test_pad_mnemonic_no_tab():
    assert pad_mnemonic("nop") == "nop"
    assert pad_mnemonic("") == ""
    assert pad_mnemonic("jr ra") == "jr ra"

def test_pad_mnemonic_single_tab_short():
    # 'add' has length 3. Format '<7s' will pad it with 4 spaces to 'add    '.
    # The formatted string is '{mn:<7s} {args}' which has an extra space.
    # Total spaces between 'add' and 'a' should be 4 (from padding) + 1 (separator) = 5 spaces.
    assert pad_mnemonic("add\ta, b, c") == "add     a, b, c"

def test_pad_mnemonic_single_tab_exact_width():
    # 'addiu32' has length 7. '<7s' will keep it as 'addiu32' (no padding).
    # Separator adds 1 space.
    assert pad_mnemonic("addiu32\ta, b") == "addiu32 a, b"

def test_pad_mnemonic_single_tab_long():
    # 'long_mnemonic' has length 13. '<7s' will keep it as 'long_mnemonic'.
    # Separator adds 1 space.
    assert pad_mnemonic("long_mnemonic\targ1") == "long_mnemonic arg1"

def test_pad_mnemonic_multiple_tabs():
    # 'add' has length 3, and args is 'foo\tbar' (since split occurs only on the first tab).
    # Expected output: 'add     foo\tbar'
    assert pad_mnemonic("add\tfoo\tbar") == "add     foo\tbar"
