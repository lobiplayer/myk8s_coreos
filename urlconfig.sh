vault write pki/root/generate/internal \
    common_name=myk8s.net \
    ttl=8760h


vault write pki/config/urls \
    issuing_certificates="http://myk8s.net:8200/v1/pki/ca" \
    crl_distribution_points="http://myk8s.net:8200/v1/pki/crl"

vault write pki/config/urls \
    issuing_certificates="http://myk8s.net:8200/v1/pki/ca" \
    crl_distribution_points="http://myk8s.net:8200/v1/pki/crl"

vault write pki/roles/myk8s-dot-net \
    allowed_domains=myk8s.net \
    allow_subdomains=true \
    max_ttl=72h

vault policy write pki - <<EOF
path "pki*"                        { capabilities = ["read", "list"] }
path "pki/sign/myk8s-dot-net"    { capabilities = ["create", "update"] }
path "pki/issue/myk8s-dot-net"   { capabilities = ["create"] }
EOF

-------

vault write pki/root/generate/internal \
    common_name=myk8s.net \
    ttl=8760h

vault write pki/config/urls \
    issuing_certificates="http://myk8s.net:8200/v1/pki/ca" \
    crl_distribution_points="http://myk8s.net:8200/v1/pki/crl"

vault write pki/roles/myk8s-dot-net \
    allowed_domains=myk8s.net \
    allow_subdomains=true \
    max_ttl=72h

vault policy write pki - <<EOF
path "pki*"                        { capabilities = ["read", "list"] }
path "pki/sign/myk8s-dot-net"    { capabilities = ["create", "update"] }
path "pki/issue/myk8s-dot-net"   { capabilities = ["create"] }
EOF

vault write auth/kubernetes/config \
    kubernetes_host="https://10.42.42.100:6443"

issuer:
https://kubernetes.default.svc.cluster.local