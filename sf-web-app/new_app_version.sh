cat <<EOF >Chart.yaml
apiVersion: v2
name: sf-web-app

description: A Helm chart for Skillfactory Django web site
type: application



version: $(cat ./Chart.yaml | grep version:| grep  -Eo -i [0-9]+\.[0-9]+\.[0-9]+ )
appVersion: "$(curl https://hub.docker.com/v2/repositories/morsh92/skillfactory-web-pg/tags?page_size=2 -H "Accept: application/json" | jq .[] | jq .[] | jq -r .name | awk "END{print}")"
EOF