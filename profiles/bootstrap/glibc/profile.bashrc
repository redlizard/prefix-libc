# Hack for bash because curses is not always available (linux).
[[ ${PN} == "bash" ]] && EXTRA_ECONF="--without-curses"

# We don't know why gcc pass 1 have /usr/include as higher priority than
# ${EPREFIX}/usr/include, which is not the case in Prefix. Keep this hack
# here until we find out why.

if [[ ${PN} == gcc ]]; then
	CPPFLAGS="-I\"${EPREFIX}\"/usr/include"
	local dlprefix=$(realpath ${EPREFIX}/lib/$(gcc -print-multi-os-directory))
	local libprefix=$(realpath ${EPREFIX}/usr/lib/$(gcc -print-multi-os-directory))
	LDFLAGS="-L\"${libprefix}\" -Wl,--dynamic-linker=\"$(echo ${dlprefix}/ld-linux*.so.*)\""
fi
