#!/bin/bash
#
# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Utility to manage COS extensions.

set -o errexit
set -o pipefail
set -o nounset

readonly PROG_NAME=$(basename "$0")
readonly COS_GPU_INSTALLER="gcr.io/cos-cloud/cos-gpu-installer:v2"
readonly OS_RELEASE="/etc/os-release"

usage() {
  cat <<EOF

${PROG_NAME}: Utility to manage COS extensions.

Usage:
    ${PROG_NAME} [OPTIONS] COMMAND [ARGS]...

Options:
    -h, --help    print help message

Commands:
    list                                  list all available COS extensions and
                                          their versions.

    install <extension> [<version>]       install a COS extension. If no version
                                          is given, then the default version
                                          will be installed.
}
EOF
  exit "${1}"
}

parse_args() {
  local args
  if ! args=$(getopt --options "h" --longoptions "help" -- "$@"); then
    usage 1
  fi

  eval set -- "${args}"
  while true; do
    case "$1" in
      -h|--help)
        usage 0
        ;;
      --)
        shift
        break
        ;;
      *)
        usage 1
        ;;
    esac
  done

  if [[ "$#" -eq 0 ]]; then
    usage 1
  fi

  case "$1" in
    list)
      list
      ;;
    install)
      if [[ "$#" -eq 2 ]]; then
        install "$2"
      elif [[ "$#" -eq 3 ]]; then
        install "$2" "$3"
      else
        usage 1
      fi
      ;;
    *)
      usage 1
      ;;
  esac
}

list() {
  printf "Available extensions for COS version %s-%s:\n\n" \
    "${VERSION_ID}" "${BUILD_ID}"
  echo "[gpu]"
  run_gpu_installer list 2>/dev/null
}

install() {
  case "$1" in
    gpu)
      shift
      run_gpu_installer install "$@"
      ;;
    *)
      echo "Unsupported extension $1"
      exit 1
      ;;
    esac
}

run_gpu_installer() {
  /usr/bin/docker run --rm \
    --name="cos-gpu-installer" \
    --privileged \
    --net=host \
    --pid=host \
    --volume /dev:/dev \
    --volume /:/root \
    "${COS_GPU_INSTALLER}" "$@"
}

main() {
  source "${OS_RELEASE}"
  parse_args "$@"
}

main "$@"
