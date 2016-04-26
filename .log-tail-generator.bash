#!/bin/bash

# Add all hosts in ssh configs
names=$(cat ~/.ssh/config | grep '^Host\ [a-z\-]*$' | sed 's/Host\ //g')

# Have one simple function for knowing if a variable is undefined
# or equal to 0
function is_defined () {
	if [[ ! $1  || $1 == "" ]]; then
		echo 0
	elif [[ $1 =~ ^[0-9]+$ ]]; then
		if [[ $1 -eq 0 ]]; then
			echo 0;
		else
			echo 1;
		fi
	else
		echo 1;
	fi
}

function only_short_param_defined () {
	first=$(is_defined $1)
	second=$(is_defined $2)
	if [[ $first -eq 0 && $second -ne 0 ]]; then
		echo 1
	else
		echo 0
	fi
}

# Main function
# Parameters
# level/l - String for level of logs (info, warn, error, trace)
# file/f - Only show logs for this specific file
# short/s - Show logs in `short` bunyan format (boolean)
# lines/l - Number of lines to tail (default 10)
# grep/g - grep for pattern before piping into bunyan
# TODO: one line logs
# TODO: follow tail
# TODO: cat/head instead of tail
function logs() {
	local environment=$1
	# shift discards the first variable. Useful for when there's 9+
	# parameters pass to a variables
	shift
	local log_file_name=$1
	shift
	local level=$1
	shift
	local l=$1
	shift
	local file=$1
	shift
	local f=$1
	shift
	local short=$1
	shift
	local s=$1
	shift
	local lines=$1
	shift
	local n=$1
	shift
	local grep=$1
	shift
	local g=$1
	shift
	local keys=$1
	shift
	local k=$1

	# Set defaults (long parameter names overwrites single letter name)
	if [[ $(only_short_param_defined $level $l) -ne 0 ]]; then
		level=$l
	fi
	if [[ $(only_short_param_defined $file $f) -ne 0 ]]; then
		file=$f
	fi
	if [[ $(only_short_param_defined $short $s) -ne 0 ]]; then
		short=$s
	fi
	if [[ $(only_short_param_defined $lines $n) -ne 0 ]]; then
		lines=$n
	fi
	if [[ $(only_short_param_defined $grep $g) -ne 0 ]]; then
		grep=$g
	fi
	if [[ $(only_short_param_defined $keys $k) -ne 0 ]]; then
		keys=$k
	fi
	# Construct basic command
	local cmd="ssh ${environment} tail -f /var/log/${log_file_name}-daemon.log";
	# Append to basic commands
	if [[ $(is_defined $lines) -ne 0 ]]; then
		cmd="$cmd -n $lines"
	fi;
	if [[ $(is_defined $grep) -ne 0 ]]; then
		cmd="$cmd  | grep '$grep'"
	fi;
	cmd="$cmd | sed 's/.*\ {/{/' | bunyan";
	if [[ $(is_defined $level) -ne 0 ]]; then
		cmd="$cmd -l $level"
	fi;
	if [[ $(is_defined $file) -ne 0 ]]; then
		cmd="$cmd -c \"this.module.indexOf('${file}') >= 0\""
	fi;
	if [[ $(is_defined $keys) -ne 0 ]]; then
		keys_separated_by_space="${keys/,/ }"
		cmd="$cmd -o json --strict | json -ga $keys_separated_by_space"
	elif [[ $(is_defined $short) -ne 0 ]]; then
		cmd="$cmd -o short"
	fi;
	# Run
	echoAndEval "${cmd}"
}

function logs-download() {
	echoAndEval "scp ${1}:/var/log/${2}.log ./";
}

function echoAndEval () {
	echo $1;
	eval $1;
}

# Go though all environments and declare a new `logs` function 
# for each one
for environment in $names
do
	# Logs
	log_file_name=$(sed 's/^[A-z]*-//g' <<< $environment)
	eval "function ${environment}-logs() {\
		local \$*;\
		logs \
			${environment} \
			${log_file_name} \
			\${level:-0} \
			\${l:-0} \
			\${file:-0} \
			\${f:-0} \
			\${short:-0} \
			\${s:-0} \
			\${lines:-0} \
			\${n:-0} \
			\${grep:-0} \
			\${g:-0} \
			\${keys:-0} \
			\${k:-0}
	};"
	# Download
	eval "function ${environment}-logs-download() {\
		logs-download ${environment} ${log_file_name}
	};"
done
