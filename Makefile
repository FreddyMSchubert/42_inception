start: run
run: verify_env
	mkdir -p /home/fschuber/data/web
	mkdir -p /home/fschuber/data/db
	cd ./srcs && docker compose -f docker-compose.yml up --build
stop:
	cd ./srcs && docker compose -f docker-compose.yml down

clean:
	rm -rf /home/fschuber/data/web
	rm -rf /home/fschuber/data/db
re: stop clean run

verify_env:
	chmod +x ./srcs/verify_env.sh
	cd ./srcs && ./verify_env.sh

log:
	rm -f directory_contents.log; \
	find . \( -type d \( -name web -o -name db -o -name .git \) -o -name "en.subject.pdf" \) -prune -o -type f -print | \
	while read -r file; do \
		echo "----- $$file -----" >> directory_contents.log; \
		head -n 100 "$$file"      >> directory_contents.log; \
		echo -e "\n"              >> directory_contents.log; \
	done; \
	cat directory_contents.log


.PHONY: start run clean stop re log verify_env
