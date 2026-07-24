import pytest
from diff import parse_relocated_line

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
