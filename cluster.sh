#/bin/bash
docker volume create rv1
docker volume create rv2
docker volume create rv3
docker volume create rv4
docker volume create rv5
docker volume create rv6
docker run -d --name r1  -v rv1:/data -p 7000:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
docker run -d --name r2  -v rv2:/data -p 7001:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
docker run -d --name r3  -v rv3:/data -p 7002:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
docker run -d --name r4  -v rv4:/data -p 7003:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
docker run -d --name r5  -v rv5:/data -p 7004:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
docker run -d --name r6  -v rv6:/data -p 7005:6379 my-redis redis-server /usr/local/etc/redis/redis.conf
redis-trib create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005
