# lua-resty-leveldb
A lua implementation of leveldb driver

主要通过ffi调用libleveldb.so库实现lua对leveldb的相关操作


# 安装说明

        1、安装leveldb驱动
        2、将leveldb.lua存放到openresty的lualib/resty/下
        3、在leveldb.lua中配置libleveldb.so地址
        4、运行demo.lua

# 例子

        local leveldb = require "resty.leveldb"
        local db = leveldb:new("/tmp/test_leveldb",{error_if_exists=false})

        local keys = {"001","k1","k2"}
        --db:batchDel(keys)
        db:batchSet({k1="0000000000000001",k2="00000000000000012"})

        db:set("001","one")
        --print(db:get("001"))
        --print(db:get("k1"))

        db:iterator_new()
        --db:iterator_seek("001")
        --print(db:iterator_next())

        for v in db:iterator_next() do
            print(v)
        end
        db:close()

# 操作方法

                1、db:get(key)
                2、db:set(key,val) / db:batchSet(table)
                3、db:del(key) / db:batchDel(table)
                4、db:iterator_new/iterator_seek/iterator_next/iterator_first/iterator_last
                5、db:close()
        
