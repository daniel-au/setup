export PATH=/Applications:Applications/Microsoft_Office_2011:$PATH
rail() {
    cd ~/Rails
}

rc() {
	vim ~/.vimrc
}

rp() {
	source /Users/batman/.profile
}

profile() {
	vim ~/../batman/.profile
}

excel() {
	open -a Microsoft\ Excel
}

word() {
	open -a Microsoft\ Word
}

word() {
	open -a Microsoft\ Word "$1"
}

pp() {
	open -a Microsoft\ PowerPoint "$1"
}

firefox() {
	open -a firefox
}

sublime() {
	open -a Sublime\ Text\ 2 "$1"
}

xcode() {
	open -a Xcode
}

showAllFiles() {
	defaults write com.apple.finder AppleShowAllFiles $1
	killall Finder
}

system() {
	open -a System\ Preferences
}

calendar() {
	open -a Calendar
}

notes() {
	open -a Notes
}

spotify() {
	open -a Spotify
}

skype() {
	open -a Skype
}

eclipse() {
	open -a Eclipse
}

rdc() {
	open -a Remote\ Desktop\ Connection
}

vlc() {
	open -a VLC.app
}

handbrake() {
	open -a handbrake.app
}

school() {
	cd ~/Spring\ 2016
}

summer() {
  cd ~/Summer/cs61a
}

myapp() {
    cd ~/Desktop/myapp
}

bs() {
    school
    cd Side\ Projects/Latex/bullshit
}

Latex() {
	school
	cd Side\ Projects/Latex
}

ee20() {
	school
	cd EE120/EE20/Textbook
}

cs170() {
	school
	cd CS170/Textbook
}

psych() {
    school
    cd Psych/Exams
}

tt() {
	cd ~/Desktop/TT\ Website/calthetatau
}

pdf() {
	#if ["$1" = "-a"]
	#then
		#echo "-a found"
		#latex "$2".tex
		#dvipdf "$2".dvi
		#rm "$2".aux "$2".log "$2".dvi
	#else
	rm "$1".aux "$1".log "$1".dvi "$1".pdf "$1".toc "$1".out
	latex "$1".tex
	latex "$1".tex
	dvipdf "$1".dvi
	open -a Preview "$1".pdf
	#fi
}

del() {
	rm "$1".aux "$1".log "$1".dvi "$1".pdf "$1".toc "$1".out
}

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
