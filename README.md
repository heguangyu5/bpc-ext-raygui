# 1. How to make

```shell
# install bpc-ext-raylib first, @see https://github.com/heguangyu5/bpc-ext-raylib

make && sudo make install
sudo ldconfig
bpc -v -c bpc-raygui.conf --static -d display_errors=on -d max_execution_time=-1 test.php
./test
```

# 2. Data Structure Map

| C                            | php                          |
| ---------------------------- | ---------------------------- |
| const char **text, int count | array('text1', 'text2', ...) |

