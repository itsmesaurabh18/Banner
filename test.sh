## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
Black_Mafia() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` || `pidof ngrok2` ]]; then
		killall ngrok > /dev/null 2>&1 || killall ngrok2 > /dev/null 2>&1
	fi	
}

## Banner
banner() {
	cat <<- EOF
${ORANGE} 
${ORANGE} ██████╗░██╗░░░░░░█████╗░░█████╗░██╗░░██╗
${ORANGE} ██╔══██╗██║░░░░░██╔══██╗██╔══██╗██║░██╔╝
${ORANGE} ██████╦╝██║░░░░░███████║██║░░╚═╝█████═╝░
${ORANGE} ██╔══██╗██║░░░░░██╔══██║██║░░██╗██╔═██╗░
${ORANGE} ██████╦╝███████╗██║░░██║╚█████╔╝██║░╚██╗
${ORANGE} ╚═════╝░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝
${ORANGE} ███╗░░░███╗░█████╗░███████╗██╗░█████╗░
${ORANGE} ████╗░████║██╔══██╗██╔════╝██║██╔══██╗
${ORANGE} ██╔████╔██║███████║█████╗░░██║███████║
${ORANGE} ██║╚██╔╝██║██╔══██║██╔══╝░░██║██╔══██║
${ORANGE} ██║░╚═╝░██║██║░░██║██║░░░░░██║██║░░██║
${ORANGE} ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝
${ORANGE} ------ Your Mind is Your Best Weapon-------●	                
	EOF
}
## Small Banner
banner_mafia() {
	cat <<- EOF
${ORANGE} 
${ORANGE} ████████████████████████████████████████████████ 
${ORANGE} █ ${RED}___  _  _ _ ____ _  _ _ _  _ ____ ${MAGENTA}BlackMafia ${ORANGE}█
${ORANGE} █ ${RED}|__] |__| | [__  |__| | |\ | | __ ${MAGENTA}WhatsApp   ${ORANGE}█
${ORANGE} █ ${RED}|    |  | | ___] |  | | | \| |__] ${MAGENTA}03094161457${ORANGE}█
${ORANGE} █                                              ${ORANGE}█
${ORANGE} ████████████████████████████████████████████████
	EOF
}

