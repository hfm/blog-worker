
## usage

```sh
sudo -E PATH=/usr/local/ruby-2.1.0/bin:$PATH su -c 'bundle exec ruby blog_worker.rb -e production -p <PORT>'

```

### system

```
                                3. Pull
                       +--------------------------+
                       |                          |
                       |                      ......................
                       |                      : server             :
                       v                      :                    :
+-------+  1. Push   +--------+  2. WebHook   : +----------------+ :
| local | ---------> | github | ------------> : | blog_worker.rb | :
+-------+            +--------+               : +----------------+ :
                                              :   |                :
                                              :   | 4. Build       :
                                              :   v                :
                                              : +----------------+ :
                                              : |    build.sh    | :
                                              : +----------------+ :
                                              :   |                :
                                              :   | 5. Sync        :
                                              :   v                :
                                              : +----------------+ :
                                              : | blog directory | :
                                              : +----------------+ :
                                              :                    :
                                              :....................:
```
