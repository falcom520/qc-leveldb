local leveldb = require "leveldb"
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
