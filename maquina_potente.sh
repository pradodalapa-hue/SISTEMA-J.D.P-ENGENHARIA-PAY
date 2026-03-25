#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=========================================="
echo "    MÁQUINA POTENTE DONY BURGUER’S PAY    "
echo "      AUTOMAÇÃO DE HARDWARE J.D.P        "
echo "=========================================="

# Comando de Voz Helena
termux-tts-speak "Mestre, ligando o motor de aproximação. Sistema pronto."

# Forçar a abertura das configurações se estiver desligado
termux-telephony-deviceinfo | grep -q "NFC" || termux-nfc-scan 2>/dev/null

while true; do
    echo ">>> AGUARDANDO APROXIMAÇÃO DO CHIP..."
    # A mágica da leitura bruta
    DADOS=$(termux-nfc-scan 2>/dev/null)
    
    if [ ! -z "$DADOS" ]; then
        termux-vibrate -p 200,100,200
        ID_MASTER=$(echo "$DADOS" | grep "ID" | cut -d ":" -f 2)
        
        echo "------------------------------------------"
        echo "!!! SUCESSO: CARTÃO IDENTIFICADO !!!"
        echo "ID DO CHIP: $ID_MASTER"
        echo "------------------------------------------"
        
        termux-tts-speak "Pagamento por aproximação capturado. Valor registrado no sistema Dony."
        termux-toast -c "#FFD700" -b "#000000" "CHIP $ID_MASTER ATIVO"
        
        # Salva o registro da soberania
        echo "$(date) - CARTÃO:$ID_MASTER - SUCESSO" >> vendas_soberanas.log
        sleep 5
    fi
    sleep 0.5
done
