# create a directory and jump into it
function mkcd {
	local target=$1
	mkdir -p $target
	cd $target
}

# backup a file or directory
function bak {
	local target=$1
	cp -r $target $target.bak
}
