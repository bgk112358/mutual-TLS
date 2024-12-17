gmssl tls13_server -port 5443 -cert ../pem/gcy/gmcerts1213/gm1_chain.crt -key ../pem/gcy/gmcerts1213/gm1.key -pass "1234" -cacert ../pem/gcy/gmcerts1213/GM_ROOT_FOR_TEST.crt

gmssl tls13_client -host 127.0.0.1 -port 5443 -cert ../pem/gcy/gmcerts1213/gm2_chain.crt -key ../pem/gcy/gmcerts1213/gm2.key -pass "1234"  -cacert ../pem/gcy/gmcerts1213/GM_ROOT_FOR_TEST.crt

~/Documents/pki/mutual-GMSSL/build$ ./server/server -port 5443 -cert ../pem/gcy/gmcerts1213/gm1_chain.crt -key ../pem/gcy/gmcerts1213/gm1.key -pass "1234" -cacert ../pem/gcy/gmcerts1213/GM_ROOT_FOR_TEST.crt

~/Documents/pki/mutual-GMSSL/build$ ./client/client -host 127.0.0.1 -port 5443 -cert ../pem/gcy/gmcerts1213/gm2_chain.crt -key ../pem/gcy/gmcerts1213/gm2.key -pass "1234"  -cacert ../pem/gcy/gmcerts1213/GM_ROOT_FOR_TEST.crt
