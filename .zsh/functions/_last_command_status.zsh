#!/usr/bin/env zsh

_last_command_status() {
    local last_exit_code=$?
    local description=''
    local result=''

    if [[ ( ! -z "${last_exit_code}" ) && ( $last_exit_code -ne 0 ) ]]; then
        case $last_exit_code in
            # Signals are 128 + signal value
            $((128 + 1)))  description="SIGHUP";;
            $((128 + 2)))  description="SIGINT";;
            $((128 + 3)))  description="SIGQUIT";;
            $((128 + 4)))  description="SIGILL";;
            $((128 + 5)))  description="SIGTRAP";;
            $((128 + 6)))  description="SIGABRT";;
            $((128 + 7)))  description="SIGEMT";;
            $((128 + 8)))  description="SIGFPE";;
            $((128 + 9)))  description="SIGKILL";;
            $((128 + 10))) description="SIGBUS";;
            $((128 + 11))) description="SIGSEGV";;
            $((128 + 12))) description="SIGSYS";;
            $((128 + 13))) description="SIGPIPE";;
            $((128 + 14))) description="SIGALRM";;
            $((128 + 15))) description="SIGTERM";;
            $((128 + 16))) description="SIGURG";;
            $((128 + 17))) description="SIGSTOP";;
            $((128 + 18))) description="SIGTSTP";;
            $((128 + 19))) description="SIGCONT";;
            $((128 + 20))) description="SIGCHLD";;
            $((128 + 21))) description="SIGTTIN";;
            $((128 + 22))) description="SIGTTOU";;
            $((128 + 23))) description="SIGIO";;
            $((128 + 24))) description="SIGXCPU";;
            $((128 + 25))) description="SIGXFSZ";;
            $((128 + 26))) description="SIGVTALRM";;
            $((128 + 27))) description="SIGPROF";;
            $((128 + 28))) description="SIGWINCH";;
            $((128 + 29))) description="SIGINFO";;
            $((128 + 30))) description="SIGUSR1";;
            $((128 + 31))) description="SIGUSR2";;
        esac

        if [[ -z "${description}" ]]; then
            result=" %F{red}${last_exit_code}%f"
        else
            result=" %F{red}${last_exit_code} (${description})%f"
        fi
    fi

    _LAST_COMMAND_STATUS="${result}"
}

