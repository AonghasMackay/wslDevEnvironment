#Quick initialisation and clone of existing repo for github
#Usage: initgit <url> <optional:branch>
initgit() {
    branchName="main"
    if [[ "$2" != "" ]]; then
        branchName="$2"
    fi

    echo "amackay quick git setup:"

    if [[ "$1" != git@github.com:* ]]; then
        echo "This doesn't look like an ssh url for a github repo..."
        echo "Lets see if it's a https url"

        if [[ "$1" != https://github.com/* ]]; then
            echo "Sorry this doesn't look like a valid url for a github repo"
            return 1
        fi
    fi

    git init
    git remote add origin "$1"
    pullResult=$(git pull origin $2)

    if [[ "$pullResult" == "fatal: Couldn't find remote ref $2" ]]; then
        echo $pullResult
        return 1
    fi

    echo "git repo good to go"
    return 0
}