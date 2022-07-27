### `cat runners.txt | jq '.runners[] | select(any(.labels[]; .name=="self-hosted")) | .id'`
```console
69
70
```
