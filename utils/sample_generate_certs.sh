# Root CA
openssl genrsa -out root-ca-key.pem 2048
openssl req -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem
# Sample cert
openssl genrsa -out sample-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in sample-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out sample-key.pem
openssl req -new -key sample-key.pem -out sample.csr
openssl x509 -req -in sample.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out sample.pem
# Cleanup
rm sample-key-temp.pem
rm sample.csr
