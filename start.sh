source /etc/profile

#通过模板文件生成一份需要替换的目标文件
create_file() {
    bakfile=$1
    suffix=$2

    d=$(dirname $bakfile)
    f=$(basename $bakfile $suffix)
    df="${d}/${f}"
    cp $bakfile $df
    # for return
    echo $df
}

# 替换admin端口为main_port
replace_content(){
    conf=$1
    vars=$2
    vard=$3

    echo $vars
    echo $vard
    sed -i "s#$vars#${vard}#g" $conf
}


#  替换admin资源文件
BAKFILE="./xxl-job-admin/src/main/resources/application.properties.bak"
APPFILE=$(create_file $BAKFILE ".bak")

main_port="${MAIN_PORT:-8080}"
replace_content $APPFILE "\${MAIN_PORT}" $main_port
