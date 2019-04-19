#!/usr/bin/env bash

HOST=localhost:8080

curl -v $HOST/login -u user1:user1 | grep 'Authroization'
# user1 has "USER" role and shouldn't be able to access /api/admin

curl -v -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsInJvbGVzIjoiUk9MRV9VU0VSIiwiaXNzIjoicmFwaGEuaW8iLCJleHAiOjE1NTM0MzE1OTN9.X65dGevaW8YJD8cB8g05fdDj4QIsScfUy88x48i32pA' $HOST/api/admin

curl -v -H \
    'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJndWVzdCIsInJvbGVzIjoiUk9MRV9HVUVTVCIsImlzcyI6InJhcGhhLmlvIiwiZXhwIjoxNTUzNDMzNjU5fQ.EuUbw6Bg2D3DsNZKRExEKQyjXlwjDbKo2r3TmB3xdPc' \
    $HOST/api/private

curl -v -H \
    'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJndWVzdCIsInJvbGVzIjoiUk9MRV9HVUVTVCIsImlzcyI6InJhcGhhLmlvIiwiZXhwIjoxNTUzNDMzNjU5fQ.EuUbw6Bg2D3DsNZKRExEKQyjXlwjDbKo2r3TmB3xdPc' \
    $HOST/api/admin



curl -v   $HOST/api/private
curl -v -u user1:user1 $HOST/api/admin
curl -v -u user1:user1 $HOST/api/private
curl -v -u user1:user1 $HOST/api/guest

curl -v -u user:user $HOST/login
curl -v -u user:user $HOST/api/admin
curl -v -u user:user $HOST/api/private

curl -v -u guest:guest $HOST/login
curl -v -u guest:guest $HOST/api/admin
curl -v -u guest:guest $HOST/api/private
curl -v -u guest:guest $HOST/api/guest

