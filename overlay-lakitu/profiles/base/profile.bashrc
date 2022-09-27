
# Override some CFLAGS that are set in make.conf.generic-target. We can't
# override these flags in our make.defaults because our make.defaults is
# evaluated before make.conf.generic-target is evaluated.
CFLAGS_OVERRIDE="-fno-function-sections -fno-data-sections"
export CFLAGS="${CFLAGS} ${CFLAGS_OVERRIDE}"
export CXXFLAGS="${CXXFLAGS} ${CFLAGS_OVERRIDE}"

# Set the platform-specific NTP servers and options
export COS_NTP_SERVERS="metadata.google.internal"
export COS_NTP_SERVERS_OPTIONS=""

# Load all additional bashrc files we have for this package.
lakitu_stack_bashrc() {
        local cfg cfgd

        cfgd="/mnt/host/source/src/overlays/overlay-lakitu/${CATEGORY}/${PN}"
        for cfg in ${PN} ${P} ${PF} ; do
                cfg="${cfgd}/${cfg}.bashrc"
                [[ -f ${cfg} ]] && . "${cfg}"
        done
}
lakitu_stack_bashrc

