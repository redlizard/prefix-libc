# Hack for bash because curses is not always available (linux).
[[ ${PN} == "bash" ]] && EXTRA_ECONF="--without-curses"
