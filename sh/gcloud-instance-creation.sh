gcloud compute instances create ro-dou \
    --project=<you-project-name> \
    --zone=southamerica-east1-b \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=<your-project-service-account> \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=ro-dou,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230411,mode=rw,size=10,type=projects/raspadorolivieri/zones/us-central1-a/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=ec-src=vm_add-gcloud \
    --reservation-affinity=any

gcloud compute addresses create ro-dou-address --project=<you-project-name> --region=southamerica-east1 && \
gcloud compute instances add-access-config ro-dou --project=<you-project-name> --zone=southamerica-east1-b --address=IP_OF_THE_NEWLY_CREATED_STATIC_ADDRESS