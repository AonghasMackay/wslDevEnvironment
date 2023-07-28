#Quick initialisation and clone of existing repo for github
initgit() {
    echo "amackay quick git setup:"

    if [[ "$1" != git@github.com:* ]]; then
        echo "Sorry this doesn't look like an ssh url for a github repo"
        return 1
    fi

    git init
    git remote add origin "$1"
    git pull origin main

    echo "git repo good to go"
    return 0
}