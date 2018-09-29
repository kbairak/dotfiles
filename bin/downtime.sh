while true; do
    ping -c 1 -t 5 www.google.com || (
        echo "downtime at $(date)" | tee -a ~/.downtime
    )
    sleep 60
done
