all: tests/sortJs.js tests/sortWasm.js tests/addfunc.js

tests/sortJs.js: tests/sort.cpp
	./run.sh /opt/cheerp/bin/clang++ -target cheerp -cheerp-pretty-code $^ -O2 -o $@

tests/sortWasm.js: tests/sort.cpp
	./run.sh /opt/cheerp/bin/clang++ -target cheerp-wasm -cheerp-pretty-code $^ -O2 -o $@

tests/addfunc.js: tests/addfunc.cpp
	./run.sh /opt/cheerp/bin/clang++ -target cheerp -cheerp-pretty-code $^ -O2 -o $@
