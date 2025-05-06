#!/bin/bash
curl --max-time 2 http://127.0.0.1:8080/health || exit 1
