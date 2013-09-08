# Hack for bash because curses is not always available (linux).
[[ ${PN} == "bash" ]] && EXTRA_ECONF="--without-curses"

# We don't know why gcc pass 1 have /usr/include as higher priority than
# ${EPREFIX}/usr/include, which is not the case in Prefix. Keep this hack
# here until we find out why.

if [[ ${PN} == gcc ]]; then
	CPPFLAGS="-I${EPREFIX}/tmp/usr/include"
	echo $CPPFLAGS
	LDFLAGS="-Wl,--dynamic-linker=$(echo ${EPREFIX}/lib*/ld-linux*.so.*)"
fi
