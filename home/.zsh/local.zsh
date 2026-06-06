#!/usr/bin/env zsh

# Machine-local configuration.

# ==============================================================================
# Toolchains
# ==============================================================================

export ARM_NONE_EABI_TOOLCHAIN_PATH="/Applications/ArmGNUToolchain/15.2.rel1/arm-none-eabi"
export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"

typeset -U path
path=(
  "$ARM_NONE_EABI_TOOLCHAIN_PATH/bin"
  "/Applications/SEGGER/JLink/JFlash.app/Contents/MacOS"
  $path
)
export PATH

# ==============================================================================
# Local Completions
# ==============================================================================

# lazy-load bun.
bun() {
  command bun "$@"
  local ret=$?

  if [[ -z "$BUN_COMPLETE" ]]; then
    [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
    BUN_COMPLETE=1
  fi

  return $ret
}
