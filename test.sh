set -e
javac DocSearchServer.java Server.java
for TEST in test-files/*.txt
do
    OUTPUT=$(java DocSearchServer < $TEST)
    EXPECTED=$(cat $TEST.expect)
    cat $OUTPUT
    if [[ $OUTPUT == $EXPECTED ]]
    then
        echo "Success"
    else
        echo "Failure"
    fi
done