#!/bin/bash

tar cz env | openssl enc -aes-256-cbc -pbkdf2 -e -pass "pass:${1}" > env.tar.gz.enc