kill_process() {
    proc=$1
    pidInfo=$(ps -ef | grep "${proc}" | grep -v grep | awk '{print $2}')

    for pid in $pidInfo;do
        kill $pid
    done
}
