kubectl patch deploy localport --patch '{"spec":{"template":{"spec":{"containers": [{"name":"localport", "env":[{"name": "PROXY_TARGET_HOST", "value":"$POD_IP"}]}]}}}}'
