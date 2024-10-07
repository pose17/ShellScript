
PkgInstall() {
    PKGLIST="$*"
    yum -q -y install $PKGLIST
    [ $? -eq 0 ] \
        && echo "[  OK  ] $PKGLIST 설치 완료" \
        || echo "[ FAIL ] $PKGLIST 설치 실패"
}

RandomIndex() {
    INDEXFILE="$1"
    MESSAGES="$2"
    FILE1=/root/shell/boxlist
    MAX=$(wc -l < $FILE1) # MAX=72

    RANDNUM=$(($RANDOM% $MAX+1))
    
    BOXSTR=$(sed -n "${RANDNUM}p" "$FILE1")
    cat << EOF > $INDEXFILE
<pre>
$(echo "$MESSAGES" | boxes -d "$BOXSTR")
</pre>
EOF
}

ServiceStart() {
    SVC="$1"
    systemctl restart "$SVC" >/dev/null 2>&1
    RET=$(systemctl is-active "$SVC")
    if [ "$RET" = 'active' ]; then
        echo "[  OK  ] 정상적으로 $SVC 서비스가 실행되었습니다."
        systemctl enable "$SVC" >/dev/null 2>&1
    else
        echo "[ FAIL ] $SVC 서비스가 실행되지 않았습니다."
    fi
}

FWRule() {
    RULES="$*"      # http https -> {http,https}
    FWCMD='firewall-cmd --permanent'
    for i in $RULES
    do
        FWCMD="$FWCMD --add-service=${i}"
    done
    $FWCMD >/dev/null 2>&1
    firewall-cmd --reload >/dev/null 2>&1
    echo "[  OK  ] $* 방화벽에 등록되었습니다."
}
