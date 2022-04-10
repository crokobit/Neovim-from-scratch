dev:
	./bash.sh
bash:
	docker exec -it $$(docker container ls --format="{\"image\":\"{{.Image}}\", \"id\":\"{{.ID}}\"}"  | jq 'select(.image=="mynvim")' | jq -r .id) bash
rm:
	docker container stop $$(docker container ls --format="{\"image\":\"{{.Image}}\", \"id\":\"{{.ID}}\"}"  | jq 'select(.image=="mynvim")' | jq -r .id)
	docker container rm $$(docker container ls -al --format="{\"image\":\"{{.Image}}\", \"id\":\"{{.ID}}\"}" | jq 'select(.image=="mynvim")' | jq -r .id)
