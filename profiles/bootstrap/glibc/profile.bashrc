# Hack for bash because curses is not always available (linux).
[[ ${PN} == "bash" ]] && EXTRA_ECONF="--without-curses"

if [[ ${PN} == gcc ]]; then
	CPPFLAGS="-I${EPREFIX}/usr/include"
	local dlprefix=$(realpath ${EPREFIX}/lib/$(gcc -print-multi-os-directory))
	LDFLAGS="--sysroot=${EPREFIX} -Wl,--dynamic-linker=$(echo ${dlprefix}/ld-linux*.so.*)"
fi
