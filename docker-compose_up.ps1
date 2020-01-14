
$p = (pwd) -replace "([A-Z]{1}):\\","/`$1/"
$env:PWD = ($p.substring(0,2).ToLower() + $p.substring(2)).replace("\", "/")
Get-ChildItem Env:PWD

$env:IMAGE_TAG = '7.5.1'
$kibana_host = 'standalone.elk-kibana:5601'
$elasticsearch = 'standalone.elk-elasticsearch:9200'
$env:APM_COMMAND = "--strict.perms=false -e -E apm-server.kibana.host=`"$kibana_host`" -E output.elasticsearch.hosts=[`"$elasticsearch`"]"

docker-compose down -v
docker-compose up -d
docker-compose logs -f
