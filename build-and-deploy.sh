#!/bin/sh

if [ -f .env ]; then
  export "$(xargs <.env)"
fi

# ---------------------------------------------
# Terraform
# ---------------------------------------------

cd terraform || exit
terraform init
terraform apply -var-file "$1" -auto-approve
terraform output >>../terraform_output.txt
cd - || exit

# ---------------------------------------------
# Frontend
# ---------------------------------------------

npm ci
npm run build
BUCKET_NAME=$(grep -o '".*"' terraform_output.txt | sed 's/"//g')
aws s3 cp ./dist "s3://${BUCKET_NAME}/" --recursive

# ---------------------------------------------
# Docker
# ---------------------------------------------

docker build --build-arg VITE_CHARACTERS="${VITE_CHARACTERS}" -t guess-who:latest .
