#! /bin/sh

curl -s -H "Authorization: Bearer $MEALIE_TOKEN" https://$MEALIE_URL/api/recipes\?perPage=500 | jq '.items[].slug' | tr -d '"' > recipes_list
while read RECIPE; do wget --quiet --directory-prefix=temp "https://$MEALIE_URL/g/home/r/${RECIPE}"; done < recipes_list;
sed -i "s/${MEALIE_URL}/extern-${MEALIE_URL}/g" ./temp/*
rsync -vaie "ssh -o LogLevel=ERROR -o StrictHostKeyChecking=no -i $RSYNC_SSH_KEY" --delete --recursive ./temp/ $RSYNC_USER@$RSYNC_HOST:mealie
exit 0
