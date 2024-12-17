gmssl certparse -in cacert.cer


##################################### ok ##################################################
gmssl sm2keygen -pass 1234 -out rootcakey.pem
gmssl certgen -C CN -ST Beijing -L Haidian -O PKU -OU CS -CN ROOTCA -days 3650 -key rootcakey.pem -pass 1234 -out rootcacert.cer -key_usage keyCertSign -key_usage cRLSign -ca

gmssl sm2keygen -pass 1234 -out subcakey.pem
gmssl reqgen -C CN -ST Beijing -L Haidian -O PKU -OU CS -CN "Sub CA" -key subcakey.pem -pass 1234 -out subcareq.csr
gmssl reqsign -in subcareq.csr -days 365 -key_usage keyCertSign -cacert rootcacert.cer -key rootcakey.pem -pass 1234 -out subcacert.cer -ca -path_len_constraint 0

gmssl sm2keygen -pass 1234 -out server.pem
gmssl reqgen -C CN -ST Beijing -L Haidian -O PKU -OU CS -CN Server -key server.pem -pass 1234 -out serversignreq.csr
gmssl reqsign -in serversignreq.csr -days 365 -key_usage digitalSignature -cacert subcacert.cer -key subcakey.pem -pass 1234 -out serversigncert.cer

gmssl sm2keygen -pass 1234 -out client.pem
gmssl reqgen -C CN -ST Beijing -L Haidian -O PKU -OU CS -CN Client -key client.pem -pass 1234 -out clientsignreq.csr
gmssl reqsign -in clientsignreq.csr -days 365 -key_usage digitalSignature -cacert subcacert.cer -key subcakey.pem -pass 1234 -out clientsigncert.cer

cat serversigncert.cer subcacert.cer > server_chain.cer
cat clientsigncert.cer subcacert.cer > client_chain.cer

gmssl certverify -in server_chain.cer -cacert rootcacert.cer
gmssl certverify -in client_chain.cer -cacert rootcacert.cer

./server/server -port 5443 -cert ../pem/normal_inte_3/server_chain.cer -key ../pem/normal_inte_3/server.pem -pass "1234" -cacert ../pem/normal_inte_3/rootcacert.cer 
./client/client -host 127.0.0.1 -port 5443 -cert ../pem/normal_inte_3/client_chain.cer -key ../pem/normal_inte_3/client.pem -pass "1234"  -cacert ../pem/normal_inte_3/rootcacert.cer
######################################################################################






