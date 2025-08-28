# lex-yacc
# Compiler Design Lab 5


- `q1/`  
  Variable declaration parser using Lex and Yacc.
- `q2/`  
  Expression parser and evaluator using Lex and Yacc.
- `q3/`  
  Simple parser supporting variable declarations, assignments, and for-loops.

- `YaccTool/`  
  Contains additional sample projects and tools:
  - `calc/`  
    Calculator example using Lex and Yacc.
  - `var_decl/`  
    Variable declaration example.
  - `task1/`  
    (Work-in-progress or backup files.)



-- i am using arch i need to run bison command other than arch it can be run as yacc -d q1.y
cd q1
bison -d q1.y
flex q1.l
gcc y.tab.c lex.yy.c -o
./a.out
```

Repeat similarly for `q2`, `q3`, or other folders.

## How to Run

After building, run the executable:

```sh
./a.out
```

Then enter input according to the grammar defined in the `.y` file.

## Requirements

- Flex (Lex implementation)
- Bison (Yacc implementation)
- GCC (C compiler)

## Notes

- Each folder is independent and can be built/run separately.
- See each `.y` file for grammar details and expected input/output.

## experience 
- i got lots of error 
- i use chatgpt and geeksforgeeks

