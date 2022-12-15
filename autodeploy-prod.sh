ACCOUNT=395321600628
REGION=ap-southeast-1
SECRET_NAME=smarttradzt-ecr
EMAIL=raja.r@smarttradzt.com
NAMESPACE=pricing-tool-int

TOKEN=`aws ecr --region=$REGION get-authorization-token --output text --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2`
echo $TOKEN

kubectl config set-context kubernetes-admin@kubernetes --namespace=$NAMESPACE
kubectl delete secret --ignore-not-found $SECRET_NAME
kubectl create secret docker-registry $SECRET_NAME \
 --docker-server=https://${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com \
 --docker-username=AWS \
 --docker-password="${TOKEN}" \
 --docker-email="${EMAIL}"

rm -rf iocl.zip
rm -rf iocl
wget https://github.com/acceval/temp-iocl/raw/main/iocl.zip
unzip iocl.zip
kubectl apply -k iocl/pricing-tool/overlays/production