# 1. How to make

```shell
make debug && make && sudo make install
bpc -v -c bpc-raygui.conf --static -d display_errors=on test.php
./test
```

# 2. Data Structure Map

| C                            | php                          |
| ---------------------------- | ---------------------------- |
| const char **text, int count | array('text1', 'text2', ...) |

