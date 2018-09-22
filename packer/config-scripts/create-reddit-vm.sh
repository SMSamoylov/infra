gcloud compute instances create reddit-vm\
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --image-project=infra-205114 \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure

