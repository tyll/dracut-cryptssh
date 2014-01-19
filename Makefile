PREFIX?=/usr
LIBEXECDIR?=/libexec
DRACUT_MODULE_DIR=/usr/share/dracut/modules.d

build: wait_for_file 89cryptssh/cryptroot-ask-wait_for_file.sh

89cryptssh/cryptroot-ask-wait_for_file.sh: /usr/share/dracut/modules.d/90crypt/cryptroot-ask.sh ./build-cryptroot-ask.sh
	./build-cryptroot-ask.sh

wait_for_file: wait_for_file.c
	gcc $(CFLAGS) -o wait_for_file wait_for_file.c

install: build
	install -D wait_for_file $(DESTDIR)$(PREFIX)$(LIBEXECDIR)/dracut-cryptssh/wait_for_file
	rm -rf $(DESTDIR)$(DRACUT_MODULE_DIR)/89cryptssh
	mkdir -p $(DESTDIR)$(DRACUT_MODULE_DIR)/
	cp -a 89cryptssh $(DESTDIR)$(DRACUT_MODULE_DIR)
