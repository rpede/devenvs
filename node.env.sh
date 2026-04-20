PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

. /usr/share/nvm/init-nvm.sh
