REGION="europe-west9-"

for z in a b c;  
do
    for i in $(seq 1 3);  
    do
        ZONE=${REGION}${z}
        DISK_NAME="build"${i}${z}
        gcloud compute disks create "$DISK_NAME" --size=1024 --zone="$ZONE"
    done
done

