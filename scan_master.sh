#!/data/data/com.termux/files/usr/bin/bash
while true; do
    clear
    echo "SISTEMA J.D.P - ESCUTANDO CHIP NFC..."
    DADOS=$(termux-nfc-scan 2>/dev/null)
    if [ ! -z "$DADOS" ]; then
        echo "--------------------------------"
        echo "CARTÃO DETECTADO!"
        echo "$DADOS"
        termux-vibrate -d 500
        termux-tts-speak "Sinal do chip capturado com sucesso"
        echo "--------------------------------"
        sleep 5
    fi
    sleep 1
done
