# 1. How to make

```shell
make && sudo make install
bpc -v -c bpc-raygui.conf --static -d display_errors=on -d max_execution_time=-1 test.php
./test
```

# 2. Data Structure Map

| C                            | php                          |
| ---------------------------- | ---------------------------- |
| const char **text, int count | array('text1', 'text2', ...) |

