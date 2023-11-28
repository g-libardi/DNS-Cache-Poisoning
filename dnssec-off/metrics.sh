#!/bin/bash

# Endereço do servidor DNS
DNS_SERVER="192.168.1.68"
PORT="53000"

# Domínios para consulta DNS
DOMAINS=("google.com" "facebook.com" "twitter.com" "instagram.com" "linkedin.com" "github.com" "yahoo.com" "amazon.com" "microsoft.com" "apple.com")

# Inicializa a soma da latência
total_latency=0

# Número de requisições
num_requests=10

# Loop através dos domínios
for domain in "${DOMAINS[@]}"; do
    echo "Realizando requisições para $domain:"
    latency=$(dig @$DNS_SERVER "-p" $PORT $domain | grep "Query time:" | awk '{print $4}')
    echo "Requisição $i: $latency ms"
    total_latency=$((total_latency + latency))
    echo
done

# Calcula a média da latência
average_latency=$((total_latency / (${#DOMAINS[@]})))

echo "Média de latência: $average_latency ms"
