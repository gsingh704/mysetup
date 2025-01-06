#!/bin/bash

base_url="https://xtremio.elfhosted.com/eyJ1c2VybmFtZSI6IlRlc3RWb2lkMjc4IiwicGFzc3dvcmQiOiI4MzYzOTYyOSIsIkJhc2VVUkwiOiJodHRwOi8vd2VhcmV0aGViZXN0LnVrIn0/catalog/tv/wek%3Atv/genre="
echo "#EXTM3U" > "tv.m3u"
fetch_json() {
    local url="$1"
    while true; do
        json=$(curl -s "$url")
        if echo "$json" | jq . >/dev/null 2>&1; then
            echo "$json"
            return
        else
            echo "Failed to fetch $url. Retrying..." >&2
            sleep 1
        fi
    done
}
manifest_url="https://xtremio.elfhosted.com/eyJ1c2VybmFtZSI6IlRlc3RWb2lkMjc4IiwicGFzc3dvcmQiOiI4MzYzOTYyOSIsIkJhc2VVUkwiOiJodHRwOi8vd2VhcmV0aGViZXN0LnVrIn0/manifest.json"
manifest_json=$(fetch_json "$manifest_url")
echo "$manifest_json" | jq -r '.catalogs[2].extra[] | select(.name == "genre") | .options[]' | while read -r genre; do
    encoded_genre=$(jq -rn --arg v "$genre" '$v | @uri')
    genre_url="${base_url}${encoded_genre}.json"
    echo "Processing genre: $genre"
    genre_json=$(fetch_json "$genre_url")
    echo "$genre_json" | jq -r --arg genre "$genre" '
        .metas[] | 
        .id |= sub("wek:"; "") | 
        "#EXTINF:-1 tvg-id=\"\(.id)\" tvg-logo=\"\(.poster)\" group-title=\"\($genre)\", \(.name)\nhttp://wearethebest.uk/live/TestVoid278/83639629/\(.id).ts"
    ' >> "tv.m3u"
done
echo "M3U file generated successfully"
