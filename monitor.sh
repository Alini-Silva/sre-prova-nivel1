#!/bin/bash

echo "=== Monitor de Saúde da Aplicação ==="
echo ""

# Cores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Verifica saúde
echo "1. Verificando saúde da aplicação..."
HEALTH=$(curl -s http://localhost:8001/health)

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Aplicação está saudável${NC}"
    echo "$HEALTH"
else
    echo -e "${RED}✗ Aplicação não está respondendo${NC}"
    exit 1
fi

echo ""
echo "2. Métricas da aplicação..."
METRICS=$(curl -s http://localhost:8001/metrics)

echo "$METRICS"

echo ""
echo "3. Verificando taxa de sucesso..."

SUCCESS_RATE=$(echo "$METRICS" | grep -o '"success_rate_percent":[0-9.]*' | grep -o '[0-9.]*')

echo -e "${GREEN}✓ Taxa de sucesso: $SUCCESS_RATE%${NC}"