#!sh

httplogfile=$(hostname).http
pinglogfile=$(hostname).ping


targets="dynamodb.us-east-1.amazonaws.com
dynamodb.us-east-2.amazonaws.com
dynamodb.us-west-1.amazonaws.com
dynamodb.us-west-2.amazonaws.com
dynamodb.ca-central-1.amazonaws.com
dynamodb.eu-west-1.amazonaws.com
dynamodb.eu-west-2.amazonaws.com
dynamodb.eu-central-1.amazonaws.com
dynamodb.eu-west-3.amazonaws.com
dynamodb.eu-north-1.amazonaws.com
dynamodb.me-south-1.amazonaws.com
dynamodb.ap-east-1.amazonaws.com
dynamodb.ap-south-1.amazonaws.com
dynamodb.ap-northeast-3.amazonaws.com
dynamodb.ap-northeast-2.amazonaws.com
dynamodb.ap-southeast-1.amazonaws.com
dynamodb.ap-southeast-2.amazonaws.com
dynamodb.ap-northeast-1.amazonaws.com
dynamodb.sa-east-1.amazonaws.com
dynamodb.cn-north-1.amazonaws.com.cn
dynamodb.cn-northwest-1.amazonaws.com.cn
dynamodb.us-gov-east-1.amazonaws.com
dynamodb.us-gov-west-1.amazonaws.com"

for i in ${targets}; do
    date -R >> ${httplogfile}
    httping -c 10 -S https://${i}/ >> ${httplogfile}
    date -R >> ${pinglogfile}
    ping -c 10 ${i} >> ${pinglogfile}
done
