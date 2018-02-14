require './symbol_table.rb'

line = "(FOOBAR)"
SymbolTable.parse(line, 1)

p SymbolTable.get_value("FOOBAR") == SymbolTable.send(:pad_binary, 1)

line = "@100"
p SymbolTable.get_value("100") == nil