echo "-----BEGIN CERTIFICATE-----" > client.crt
cat ori.crt >> client.crt
echo "-----END CERTIFICATE-----" >> client.crt

echo "-----BEGIN PRIVATE KEY-----" > client.key
cat ori.key >> client.key
echo "-----END PRIVATE KEY-----" >> client.key



